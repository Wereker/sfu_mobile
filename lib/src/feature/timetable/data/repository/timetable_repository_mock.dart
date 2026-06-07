import 'package:sfu/src/feature/timetable/data/data_source/remote/timetable_remote_data_source.dart';
import 'package:sfu/src/feature/timetable/data/mapper/lesson_mapper.dart';
import 'package:sfu/src/feature/timetable/domain/entity/timetable/timetable.dart';
import 'package:sfu/src/feature/timetable/domain/repository/timetable_repository.dart';

class TimetableRepositoryMock implements TimetableRepository {
  final TimetableRemoteDataSource _remote;
  const TimetableRepositoryMock(this._remote);

  @override
  Future<Timetable> getTimetable({
    required int targetId,
    required TimetableTargetType type,
  }) async {
    final dto = await _remote.getTimetableForTarget(
      targetId: targetId,
      type: type,
    );
    return TimetableMapper.fromDTO(dto);
  }

  @override
  Future<Timetable> getTimetableForTarget({
    required int targetId,
    required TimetableTargetType type,
  }) async {
    final dto = await _remote.getTimetableForTarget(
      targetId: targetId,
      type: type,
    );
    return TimetableMapper.fromDTO(dto);
  }
}