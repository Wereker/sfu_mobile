import 'package:sfu/src/feature/timetable/data/data_source/remote/timetable_remote_data_source.dart';
import 'package:sfu/src/feature/timetable/domain/entity/timetable/timetable.dart';

abstract class TimetableRepository {
  /// Загрузить расписание текущего пользователя по его groupId или teacherId
  Future<Timetable> getTimetable({
    required int targetId,
    required TimetableTargetType type,
  });

  /// Поиск по произвольному id (из строки поиска)
  Future<Timetable> getTimetableForTarget({
    required int targetId,
    required TimetableTargetType type,
  });
}