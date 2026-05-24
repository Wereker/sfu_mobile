import 'package:sfu/src/feature/timetable/data/data_source/remote/timetable_remote_data_source.dart';
import 'package:sfu/src/feature/timetable/domain/entity/timetable/timetable.dart';

abstract class GetTimetableUseCase {
  /// [targetId] — groupId или teacherId из профиля / поиска
  /// [type] — group или teacher
  Future<Timetable> call({
    required int targetId,
    required TimetableTargetType type,
  });
}
