import 'package:sfu/src/feature/chat/domain/entity/chat/chat.dart';

abstract class ChatLoadDataUseCase {
  Future<List<Chat>> call();
}