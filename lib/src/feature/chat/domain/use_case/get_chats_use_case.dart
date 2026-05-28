import 'package:sfu/src/feature/chat/domain/entity/chat.dart';

abstract class GetChatsUseCase {
  Future<List<Chat>> call();
}