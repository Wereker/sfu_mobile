import 'package:sfu/src/core/error/exception_handler.dart';
import 'package:sfu/src/feature/timetable/data/data_source/local/timetable_local_data_source.dart';
import 'package:sfu/src/feature/timetable/data/data_source/remote/timetable_remote_data_source.dart';
import 'package:sfu/src/feature/timetable/data/mapper/lesson_mapper.dart';
import 'package:sfu/src/feature/timetable/domain/entity/timetable/timetable.dart';
import 'package:sfu/src/feature/timetable/domain/repository/timetable_repository.dart';

class TimetableRepositoryImpl implements TimetableRepository {
  final TimetableRemoteDataSource _remote;
  final TimetableLocalDataSource _local;

  const TimetableRepositoryImpl({
    required TimetableRemoteDataSource remote,
    required TimetableLocalDataSource local,
  })  : _remote = remote,
        _local = local;

  @override
  Future<Timetable> getTimetable({
    required int targetId,
    required TimetableTargetType type,
  }) =>
      ExceptionHandler.handle(() async {
        // TODO: добавить кэш — сначала читать из _local, при промахе идти в _remote
        final dto = await _remote.getTimetableForTarget(
          targetId: targetId,
          type: type,
        );
        return TimetableMapper.fromDTO(dto);
      });

  @override
  Future<Timetable> getTimetableForTarget({
    required int targetId,
    required TimetableTargetType type,
  }) =>
      ExceptionHandler.handle(() async {
        final dto = await _remote.getTimetableForTarget(
          targetId: targetId,
          type: type,
        );
        return TimetableMapper.fromDTO(dto);
      });
}