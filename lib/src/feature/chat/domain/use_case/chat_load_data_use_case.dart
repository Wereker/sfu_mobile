import 'package:sfu/src/feature/chat/domain/entity/chat.dart';

abstract class ChatLoadDataUseCase {
  Future<List<Chat>> call();
}