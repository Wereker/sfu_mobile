import 'package:sfu/src/feature/timetable/data/data_source/remote/timetable_remote_data_source.dart';
import 'package:sfu/src/feature/timetable/data/mapper/lesson_mapper.dart';
import 'package:sfu/src/feature/timetable/domain/entity/timetable/timetable.dart';
import 'package:sfu/src/feature/timetable/domain/repository/timetable_repository.dart';

class TimetableRepositoryMock implements TimetableRepository {
  final TimetableRemoteDataSource _remote;

  const TimetableRepositoryMock({required TimetableRemoteDataSource remote})
      : _remote = remote;

  @override
  Future<Timetable> getTimetable() async {
    final dto = await _remote.getTimetableForTarget('КИ22-13Б (1 подгруппа)');
    return TimetableMapper.fromDTO(dto);
  }

  @override
  Future<Timetable> getTimetableForTarget(String target) async {
    final dto = await _remote.getTimetableForTarget(target);
    return TimetableMapper.fromDTO(dto);
  }
}