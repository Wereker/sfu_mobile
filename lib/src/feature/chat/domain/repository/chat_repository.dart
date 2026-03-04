import 'package:sfu/src/feature/chat/domain/entity/chat/chat.dart';

abstract class ChatRepository {
  Future<List<Chat>> loadData();
}