import 'package:firebase_auth/firebase_auth.dart';
import 'package:sfu/src/core/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:sfu/src/feature/timetable/data/DTO/timetable_dto/timetable_dto.dart';
import 'package:sfu/src/feature/timetable/data/data_source/remote/timetable_remote_data_source.dart';
import 'package:sfu/src/feature/timetable/domain/entity/timetable/timetable.dart';
import 'package:sfu/src/feature/timetable/domain/repository/timetable_repository.dart';

class TimetableRepositoryFirebaseImpl implements TimetableRepository {
  final AuthLocalDataSource _locale;
  final TimetableRemoteDataSource _remote;

  const TimetableRepositoryFirebaseImpl({
    required AuthLocalDataSource locale,
    required TimetableRemoteDataSource remote,
  }) : _locale = locale,
        _remote = remote;

  @override
  Future<Timetable> getTimetable() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw Exception('User not found');
    }

    final role = await _locale.getUserRole(user.uid) ?? 'student';
    TimetableDTO timetableDTO;

    if (role == 'student') {
      final group = await _locale.getUserGroup(user.uid) ?? 'КИ23-13Б';
      final subgroup = await _locale.getUserSubgroup(user.uid) ?? '1 подгруппа';

      timetableDTO = await _remote.getTimetableForTarget('$group ($subgroup)');
    } else {
      final teacher = await _locale.getUserName(user.uid) ?? "Кушнаренко А. В.";
      timetableDTO = await _remote.getTimetableForTarget(teacher);
    }
    return Timetable.fromDTO(timetableDTO);
  }

  @override
  Future<Timetable> getTimetableForTarget(String target) async {
    final TimetableDTO timetableDTO = await _remote.getTimetableForTarget(target);
    return Timetable.fromDTO(timetableDTO);
  }
}