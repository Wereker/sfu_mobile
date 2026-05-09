import 'package:sfu/src/feature/chat/data/data_source/local/chat_locale_data_source.dart';
import 'package:sfu/src/feature/chat/data/data_source/remote/chat_remote_data_source.dart';
import 'package:sfu/src/feature/chat/data/mapper/chat_mapper.dart';
import 'package:sfu/src/feature/chat/domain/entity/chat.dart';
import 'package:sfu/src/feature/chat/domain/repository/chat_repository.dart';

class ChatRepositoryMock implements ChatRepository {
  final ChatRemoteDataSource  _remote;
  final ChatLocaleDataSource  _local;

  const ChatRepositoryMock(this._remote, this._local);

  @override
  Future<List<Chat>> loadData() async {
    final dtos = await _remote.loadChatForUser();
    return dtos.map(ChatMapper.fromDTO).toList();
  }
}