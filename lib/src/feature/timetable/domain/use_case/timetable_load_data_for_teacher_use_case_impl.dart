import 'package:sfu/src/feature/timetable/domain/entity/timetable/timetable.dart';
import 'package:sfu/src/feature/timetable/domain/repository/timetable_repository.dart';
import 'package:sfu/src/feature/timetable/domain/use_case/timetable_load_data_for_teacher_use_case.dart';

class TimetableLoadDataForTeacherUseCaseImpl implements TimetableLoadDataForTeacherUseCase {
  final TimetableRepository timetableRepo;

  const TimetableLoadDataForTeacherUseCaseImpl(this.timetableRepo);

  @override
  Future<Timetable> call() async {
    return await timetableRepo.getTimetableForTeacher();
  }
}