import 'package:sfu/src/core/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:sfu/src/feature/timetable/data/DTO/timetable_dto/timetable_dto.dart';
import 'package:sfu/src/feature/timetable/data/data_source/remote/timetable_remote_data_source.dart';
import 'package:sfu/src/feature/timetable/domain/entity/timetable/timetable.dart';
import 'package:sfu/src/feature/timetable/domain/repository/timetable_repository.dart';

class TimetableRepositoryImpl implements TimetableRepository {
  final AuthLocalDataSource _locale;
  final TimetableRemoteDataSource _remote;

  const TimetableRepositoryImpl({
    required AuthLocalDataSource locale,
    required TimetableRemoteDataSource remote,
  }) : _locale = locale,
       _remote = remote;

  @override
  Future<Timetable> getTimetable() async {
    final role = await _locale.getUserRole() ?? 'student';
    TimetableDTO timetableDTO;

    if (role == 'student') {
      final group = await _locale.getUserGroup() ?? 'КИ23-13Б';
      final subgroup = await _locale.getUserSubgroup() ?? '1 подгруппа';

      timetableDTO = await _remote.getTimetableForTarget('$group ($subgroup)');
    } else {
      // TODO: добавить получение расписание по имени преподавателя
      timetableDTO = await _remote.getTimetableForTarget("Кушнаренко А. В.");
    }
    return Timetable.fromDTO(timetableDTO);
  }

  @override
  Future<Timetable> getTimetableForTarget(String target) async {
    final TimetableDTO timetableDTO = await _remote.getTimetableForTarget(target);
    return Timetable.fromDTO(timetableDTO);
  }
}
