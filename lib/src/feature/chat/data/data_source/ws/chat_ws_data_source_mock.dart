import 'dart:async';
import 'package:sfu/src/feature/chat/data/data_source/ws/chat_ws_data_source.dart';
import 'package:sfu/src/feature/chat/message/data/dto/message_dto.dart';

class ChatWsDataSourceMock implements ChatWsDataSource {
  StreamController<MessageDTO>? _controller;
  bool _connected = false;

  @override
  bool get isConnected => _connected;

  @override
  Stream<MessageDTO> connect(int chatId) {
    _controller?.close();
    _controller = StreamController<MessageDTO>.broadcast();
    _connected = true;
    return _controller!.stream;
  }

  @override
  void send(String text) {
    if (!_connected || _controller == null) return;
    Future.delayed(const Duration(milliseconds: 300), () {
      if (_controller?.isClosed == false) {
        _controller!.add(MessageDTO(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          chatId: '1',
          senderId: '1',
          senderName: 'Вы',
          body: text,
          createdAt: DateTime.now().toIso8601String(),
          isOutgoing: true,
        ));
      }
    });
  }

  @override
  void disconnect() {
    _connected = false;
    _controller?.close();
    _controller = null;
  }
}