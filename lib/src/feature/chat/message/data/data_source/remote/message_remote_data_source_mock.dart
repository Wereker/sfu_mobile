import 'package:sfu/src/feature/chat/message/data/DTO/message_dto.dart';
import 'package:sfu/src/feature/chat/message/data/data_source/remote/message_remote_data_source.dart';

class MessageRemoteDataSourceMock implements MessageRemoteDataSource {
  final Map<String, dynamic> json = {
    "messages": {
      "chat_1": [
        {
          "id": "msg_100",
          "chatId": "chat_1",
          "senderId": "user_current",
          "text":
              "Здравствуйте, Александр Викторович! У меня вопрос по заданию №3.",
          "sentAt": "2026-03-04 09:20:10",
          "status": "read",
          "deliveredAt": "2026-03-04 09:20:12",
          "readAt": "2026-03-04 09:22:30",
          "isOutgoing": "true",
          "isEdited": "false",
          "createdAt": "2026-03-04 09:20:10",
        },
        {
          "id": "msg_101",
          "chatId": "chat_1",
          "senderId": "teacher_kushnarenko",
          "text":
              "Здравствуйте! Завтра в 10:00 состоится консультация по математическому анализу в ауд. 305.",
          "sentAt": "2026-03-04 09:23:15",
          "status": "read",
          "deliveredAt": "2026-03-04 09:23:17",
          "readAt": "2026-03-04 09:25:42",
          "isOutgoing": "false",
          "isEdited": "false",
          "createdAt": "2026-03-04 09:23:15",
        },
      ],
      "chat_2": [
        {
          "id": "msg_200",
          "chatId": "chat_2",
          "senderId": "student_ivan",
          "text": "Привет! Как продвигается проект?",
          "sentAt": "2026-03-04 12:40:15",
          "status": "read",
          "deliveredAt": "2026-03-04 12:40:18",
          "readAt": "2026-03-04 12:42:05",
          "isOutgoing": "false",
          "isEdited": "false",
          "createdAt": "2026-03-04 12:40:15",
        },
        {
          "id": "msg_205",
          "chatId": "chat_2",
          "senderId": "user_current",
          "text":
              "Давай сегодня вечером обсудим проект по мобильной разработке?",
          "sentAt": "2026-03-04 12:45:22",
          "status": "delivered",
          "deliveredAt": "2026-03-04 12:45:24",
          "readAt": "",
          "isOutgoing": "true",
          "isEdited": "false",
          "createdAt": "2026-03-04 12:45:22",
        },
      ],
      "chat_3": [
        {
          "id": "msg_300",
          "chatId": "chat_3",
          "senderId": "student_1",
          "text": "Кто уже начал делать лабу по алгоритмам?",
          "sentAt": "2026-03-04 13:05:22",
          "status": "read",
          "deliveredAt": "2026-03-04 13:05:25",
          "readAt": "2026-03-04 13:08:10",
          "isOutgoing": "false",
          "isEdited": "false",
          "createdAt": "2026-03-04 13:05:22",
        },
        {
          "id": "msg_305",
          "chatId": "chat_3",
          "senderId": "student_2",
          "text": "Я только начал, но застрял на втором задании",
          "sentAt": "2026-03-04 13:08:45",
          "status": "read",
          "deliveredAt": "2026-03-04 13:08:48",
          "readAt": "2026-03-04 13:09:20",
          "isOutgoing": "false",
          "isEdited": "false",
          "createdAt": "2026-03-04 13:08:45",
        },
        {
          "id": "msg_310",
          "chatId": "chat_3",
          "senderId": "student_3",
          "text":
              "Ребята, кто сдаст завтра лабу по алгоритмам? Нужна помощь с 3 заданием",
          "sentAt": "2026-03-04 13:10:05",
          "status": "sent",
          "deliveredAt": "",
          "readAt": "",
          "isOutgoing": "false",
          "isEdited": "false",
          "createdAt": "2026-03-04 13:10:05",
        },
      ],
      "chat_4": [
        {
          "id": "msg_420",
          "chatId": "chat_4",
          "senderId": "teacher_masich",
          "text": "Напоминаю, что дедлайн по отчётам — 10 марта",
          "sentAt": "2026-03-03 16:40:10",
          "status": "read",
          "deliveredAt": "2026-03-03 16:40:13",
          "readAt": "2026-03-03 16:42:05",
          "isOutgoing": "false",
          "isEdited": "false",
          "createdAt": "2026-03-03 16:40:10",
        },
        {
          "id": "msg_422",
          "chatId": "chat_4",
          "senderId": "dean_ivt",
          "text":
              "Внимание! 15 марта состоится общее собрание кафедры в 14:00 в конференц-зале главного корпуса.",
          "sentAt": "2026-03-03 16:45:30",
          "status": "read",
          "deliveredAt": "2026-03-03 16:45:33",
          "readAt": "2026-03-04 08:15:20",
          "isOutgoing": "false",
          "isEdited": "true",
          "createdAt": "2026-03-03 16:45:30",
        },
      ],
      "chat_5": [
        {
          "id": "msg_500",
          "chatId": "chat_5",
          "senderId": "user_current",
          "text": "Здравствуйте! Когда будет готова моя справка о зачислении?",
          "sentAt": "2026-03-02 11:15:30",
          "status": "read",
          "deliveredAt": "2026-03-02 11:15:33",
          "readAt": "2026-03-02 11:18:20",
          "isOutgoing": "true",
          "isEdited": "false",
          "createdAt": "2026-03-02 11:15:30",
        },
        {
          "id": "msg_501",
          "chatId": "chat_5",
          "senderId": "dekanat_ikit",
          "text":
              "Ваша справка готова. Можете забрать её в деканате с 9:00 до 17:00 в будние дни.",
          "sentAt": "2026-03-02 11:20:45",
          "status": "read",
          "deliveredAt": "2026-03-02 11:20:48",
          "readAt": "2026-03-02 12:05:10",
          "isOutgoing": "false",
          "isEdited": "false",
          "createdAt": "2026-03-02 11:20:45",
        },
      ],
    },
  };

  @override
  Future<List<MessageDTO>> getMessagesForChar(String chatId) async {
    await Future.delayed(Duration(seconds: 1));
    final chat = json['messages'][chatId];

    final List<MessageDTO> result = [];
    for (final item in chat) {
      result.add(MessageDTO.fromJson(item));
    }
    print(result);
    return result;
  }
}
