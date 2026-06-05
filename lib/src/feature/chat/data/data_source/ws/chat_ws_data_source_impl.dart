import 'dart:async';
import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sfu/src/core/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:sfu/src/core/error/ws_exception.dart';
import 'package:sfu/src/feature/chat/data/data_source/ws/chat_ws_data_source.dart';
import 'package:sfu/src/feature/chat/message/data/dto/message_dto.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class ChatWsDataSourceImpl implements ChatWsDataSource {
  final AuthLocalDataSource _local;

  WebSocketChannel? _channel;
  StreamController<MessageDTO>? _controller;
  int? _currentChatId;

  ChatWsDataSourceImpl(this._local);

  @override
  bool get isConnected => _channel != null;

  @override
  Stream<MessageDTO> connect(int chatId) {
    // Закрываем предыдущее соединение если оно было
    _closeCurrentConnection();

    // Создаём новый контроллер для каждого подключения
    _controller = StreamController<MessageDTO>.broadcast();
    _currentChatId = chatId;

    // Запускаем подключение асинхронно
    _connectAsync(chatId);

    return _controller!.stream;
  }

  Future<void> _connectAsync(int chatId) async {
    final token = await _local.getAccessToken();
    if (token == null) {
      _controller?.addError(const WsUnauthorizedException());
      return;
    }

    final baseUrl = dotenv.env['API_BASE_URL'] ?? '';
    final wsBase = baseUrl
        .replaceFirst('https://', 'wss://')
        .replaceFirst('http://', 'ws://');

    final uri = Uri.parse('$wsBase/chats/$chatId/ws?token=$token');

    print(uri);

    try {
      _channel = WebSocketChannel.connect(uri);

      await _channel!.ready;

      _channel!.stream.listen(
            (raw) {
          try {
            final jsonStr = raw is String ? raw : utf8.decode(raw as List<int>);
            final json = jsonDecode(jsonStr) as Map<String, dynamic>;
            _controller?.add(MessageDTO.fromJson(json));
          } catch (e) {
            _controller?.addError(WsParseException(e.toString()));
          }
        },
        onError: (e) {
          _controller?.addError(const WsDisconnectedException());
        },
        onDone: () {
          final code = _channel?.closeCode;
          _channel = null;

          if (_controller?.isClosed == false) {
            if (code == 4001) {
              _controller?.addError(const WsUnauthorizedException());
            } else if (code == 4003) {
              _controller?.addError(const WsForbiddenException());
            } else {
              _controller?.addError(const WsDisconnectedException());
            }
          }
        },
        cancelOnError: false,
      );
    } catch (e) {
      print(e);
      _controller?.addError(const WsDisconnectedException());
    }
  }

  @override
  void send(String text) {
    if (_channel == null) return;
    _channel!.sink.add(text);
  }

  @override
  void disconnect() {
    _closeCurrentConnection();
  }

  void _closeCurrentConnection() {
    _channel?.sink.close();
    _channel = null;
    if (_controller?.isClosed == false) {
      _controller?.close();
    }
    _controller = null;
    _currentChatId = null;
  }
}