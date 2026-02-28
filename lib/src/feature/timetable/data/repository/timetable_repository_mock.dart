import 'package:sfu/src/feature/timetable/data/DTO/timetable_dto/timetable_dto.dart';
import 'package:sfu/src/feature/timetable/data/data_source/remote/timetable_remote_data_source.dart';
import 'package:sfu/src/feature/timetable/domain/entity/timetable/timetable.dart';
import 'package:sfu/src/feature/timetable/domain/repository/timetable_repository.dart';

class TimetableRepositoryMock implements TimetableRepository {
  final TimetableRemoteDataSource _remote;

  const TimetableRepositoryMock({required TimetableRemoteDataSource remote})
    : _remote = remote;

  @override
  Future<Timetable> getTimetable() async {
    final role = 'student';
    TimetableDTO timetableDTO;

    if (role == 'student') {
      final group = 'КИ23-13Б';
      final subgroup = '1 подгруппа';

      timetableDTO = await _remote.getTimetableForTarget('$group ($subgroup)');
    } else {
      final teacher = "Кушнаренко А. В.";
      timetableDTO = await _remote.getTimetableForTarget(teacher);
    }
    return Timetable.fromDTO(timetableDTO);
  }

  @override
  Future<Timetable> getTimetableForTarget(String target) async {
    final TimetableDTO timetableDTO = await _remote.getTimetableForTarget(
      target,
    );
    return Timetable.fromDTO(timetableDTO);
  }
}
