import 'dart:async';
import 'dart:convert';

import 'package:sfu/src/core/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:sfu/src/core/error/ws_exception.dart';
import 'package:sfu/src/feature/chat/data/data_source/ws/chat_ws_data_source.dart';
import 'package:sfu/src/feature/chat/message/data/dto/message_dto.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ChatWsDataSourceImpl implements ChatWsDataSource {
  final AuthLocalDataSource _local;

  WebSocketChannel? _channel;
  final _controller = StreamController<MessageDTO>.broadcast();

  ChatWsDataSourceImpl(this._local);

  @override
  bool get isConnected => _channel != null;

  @override
  Stream<MessageDTO> connect(int chatId) {
    _connectAsync(chatId);
    return _controller.stream;
  }

  Future<void> _connectAsync(int chatId) async {
    final token = await _local.getAccessToken();
    if (token == null) {
      _controller.addError(const WsUnauthorizedException());
      return;
    }

    final baseUrl = dotenv.env['API_BASE_URL'] ?? '';
    // Заменяем https:// на wss:// (или http:// на ws://)
    final wsBase = baseUrl
        .replaceFirst('https://', 'wss://')
        .replaceFirst('http://', 'ws://');

    final uri = Uri.parse('$wsBase/chats/$chatId/ws?token=$token');

    try {
      _channel = WebSocketChannel.connect(uri);

      _channel!.stream.listen(
            (raw) {
          try {
            final json = jsonDecode(raw as String) as Map<String, dynamic>;
            _controller.add(MessageDTO.fromJson(json));
          } catch (e) {
            _controller.addError(WsParseException(e.toString()));
          }
        },
        onError: (e) {
          _controller.addError(WsDisconnectedException());
        },
        onDone: () {
          // Получаем код закрытия
          final code = _channel?.closeCode;
          _channel = null;

          if (code == 4001) {
            _controller.addError(const WsUnauthorizedException());
          } else if (code == 4003) {
            _controller.addError(const WsForbiddenException());
          } else {
            _controller.addError(const WsDisconnectedException());
          }
        },
        cancelOnError: false,
      );
    } catch (e) {
      _controller.addError(WsDisconnectedException());
    }
  }

  @override
  void send(String text) {
    if (_channel == null) return;
    _channel!.sink.add(text); // plain text, не JSON
  }

  @override
  void disconnect() {
    _channel?.sink.close();
    _channel = null;
  }
}