import 'package:sfu/src/feature/timetable/data/data_source/local/timetable_local_data_source.dart';
import 'package:sfu/src/feature/timetable/data/data_source/remote/timetable_remote_data_source.dart';
import 'package:sfu/src/feature/timetable/domain/entity/timetable/timetable.dart';
import 'package:sfu/src/feature/timetable/domain/repository/timetable_repository.dart';

class TimetableRepositoryImpl implements TimetableRepository {
  final TimetableLocalDataSource locale;
  final TimetableRemoteDataSource remote;

  const TimetableRepositoryImpl({required this.locale, required this.remote});

  @override
  Future<Timetable> getTimetable() async {
    final timetableDTO = await remote.getTimetableForGroup(
      'КИ25-14Б',
      '1 подгруппа',
    );
    final timetable = Timetable.fromDTO(timetableDTO);
    return timetable;
  }
}
