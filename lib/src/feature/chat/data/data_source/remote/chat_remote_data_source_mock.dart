import 'package:sfu/src/feature/chat/data/data_source/remote/chat_remote_data_source.dart';
import 'package:sfu/src/feature/chat/data/dto/chat_dto.dart';

class ChatRemoteDataSourceMock implements ChatRemoteDataSource {
  final Map<String, dynamic> json = {
    "data": [
      {
        "id": "chat_1",
        "type": "private",
        "title": "Кушнаренко А. В.",
        "avatarUrl": "https://edu.sfu-kras.ru/media/teachers/kushnarenko.jpg",
        "participantIds": ["user_current", "teacher_kushnarenko"],
        "lastMessage": {
          "id": "msg_101",
          "chatId": "chat_1",
          "senderId": "teacher_kushnarenko",
          "text": "Здравствуйте! Завтра в 10:00 состоится консультация по математическому анализу в ауд. 305.",
          "sentAt": "2026-03-04 09:23:15",
          "status": "read",
          "deliveredAt": "2026-03-04 09:23:17",
          "readAt": "2026-03-04 09:25:42",
          "isOutgoing": "false",
          "isEdited": "false",
          "createdAt": "2026-03-04 09:23:15"
        },
        "lastMessageAt": "2026-03-04 09:23:15",
        "unreadCount": "0",
        "createdAt": "2026-02-10 14:30:00",
        "updatedAt": "2026-03-04 09:23:15"
      },
      {
        "id": "chat_2",
        "type": "private",
        "title": "Иван Петров",
        "avatarUrl": "https://edu.sfu-kras.ru/media/students/ivan_petrov.jpg",
        "participantIds": ["user_current", "student_ivan"],
        "lastMessage": {
          "id": "msg_205",
          "chatId": "chat_2",
          "senderId": "user_current",
          "text": "Давай сегодня вечером обсудим проект по мобильной разработке?",
          "sentAt": "2026-03-04 12:45:22",
          "status": "delivered",
          "deliveredAt": "2026-03-04 12:45:24",
          "readAt": "",
          "isOutgoing": "true",
          "isEdited": "false",
          "createdAt": "2026-03-04 12:45:22"
        },
        "lastMessageAt": "2026-03-04 12:45:22",
        "unreadCount": "0",
        "createdAt": "2026-01-25 11:20:00",
        "updatedAt": "2026-03-04 12:45:22"
      },
      {
        "id": "chat_3",
        "type": "group",
        "title": "КИ22-13Б",
        "avatarUrl": "https://edu.sfu-kras.ru/media/groups/ki22-13b.jpg",
        "participantIds": ["user_current", "student_1", "student_2", "student_3", "student_4"],
        "lastMessage": {
          "id": "msg_310",
          "chatId": "chat_3",
          "senderId": "student_3",
          "text": "Ребята, кто сдаст завтра лабу по алгоритмам? Нужна помощь с 3 заданием",
          "sentAt": "2026-03-04 13:10:05",
          "status": "sent",
          "deliveredAt": "",
          "readAt": "",
          "isOutgoing": "false",
          "isEdited": "false",
          "createdAt": "2026-03-04 13:10:05"
        },
        "lastMessageAt": "2026-03-04 13:10:05",
        "unreadCount": "3",
        "createdAt": "2025-09-01 08:00:00",
        "updatedAt": "2026-03-04 13:10:05"
      },
      {
        "id": "chat_4",
        "type": "group",
        "title": "Кафедра ИВТ",
        "avatarUrl": "https://edu.sfu-kras.ru/media/departments/ivt.jpg",
        "participantIds": ["user_current", "teacher_kushnarenko", "teacher_masich", "dean_ivt"],
        "lastMessage": {
          "id": "msg_422",
          "chatId": "chat_4",
          "senderId": "dean_ivt",
          "text": "Внимание! 15 марта состоится общее собрание кафедры в 14:00 в конференц-зале главного корпуса.",
          "sentAt": "2026-03-03 16:45:30",
          "status": "read",
          "deliveredAt": "2026-03-03 16:45:33",
          "readAt": "2026-03-04 08:15:20",
          "isOutgoing": "false",
          "isEdited": "true",
          "createdAt": "2026-03-03 16:45:30"
        },
        "lastMessageAt": "2026-03-03 16:45:30",
        "unreadCount": "0",
        "createdAt": "2025-10-15 10:30:00",
        "updatedAt": "2026-03-03 16:45:30"
      },
      {
        "id": "chat_5",
        "type": "private",
        "title": "Деканат ИКИТ",
        "avatarUrl": "https://edu.sfu-kras.ru/media/departments/dekanat_iit.jpg",
        "participantIds": ["user_current", "dekanat_iit"],
        "lastMessage": {
          "id": "msg_501",
          "chatId": "chat_5",
          "senderId": "dekanat_ikit",
          "text": "Ваша справка готова. Можете забрать её в деканате с 9:00 до 17:00 в будние дни.",
          "sentAt": "2026-03-02 11:20:45",
          "status": "read",
          "deliveredAt": "2026-03-02 11:20:48",
          "readAt": "2026-03-02 12:05:10",
          "isOutgoing": "false",
          "isEdited": "false",
          "createdAt": "2026-03-02 11:20:45"
        },
        "lastMessageAt": "2026-03-02 11:20:45",
        "unreadCount": "0",
        "createdAt": "2026-02-20 15:10:00",
        "updatedAt": "2026-03-02 11:20:45"
      }
    ]
  };

  @override
  Future<List<ChatDTO>> loadChatForUser() async {
    await Future.delayed(Duration(seconds: 1));
    final List<ChatDTO> items = [];
    for (final item in json['data']) {
      items.add(ChatDTO.fromJson(item));
    }
    return items;
  }
}