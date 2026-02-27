import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sfu/src/feature/timetable/data/DTO/lesson_dto/lesson_dto.dart';
import 'package:sfu/src/feature/timetable/data/DTO/timetable_dto/timetable_dto.dart';
import 'package:sfu/src/feature/timetable/data/DTO/week_dto/week_dto.dart';
import 'package:sfu/src/feature/timetable/data/data_source/remote/timetable_remote_data_source.dart';

class TimetableRemoteDataSourceImpl implements TimetableRemoteDataSource {
  // TODO: Вынести DIO в отдельную структуру
  final Dio dio = Dio();
  final String baseUrl = dotenv.env['API_SFU_TIMETABLE_URL'] ?? '';

  @override
  Future<TimetableDTO> getTimetableForTarget(String target) async {
    final response = await dio.get(
      '$baseUrl/api/timetable/get',
      queryParameters: {'target': target},
      options: Options(headers: {'Accept': 'application/json'}),
    );
    final Map<String, dynamic> json = response.data;
    final List<dynamic> rawLessons = json['timetable'] ?? [];
    final Map<String, List<LessonDTO>> lessonsByWeek = {'1': [], '2': []};

    for (final lessonJson in rawLessons) {
      final lesson = LessonDTO.fromJson(lessonJson);
      final week = lessonJson['week'] as String;

      if (lessonsByWeek.containsKey(week)) {
        lessonsByWeek[week]!.add(lesson);
      }
    }

    final weeks = [
      WeekDTO(week: '1', lessons: lessonsByWeek['1']!),
      WeekDTO(week: '2', lessons: lessonsByWeek['2']!),
    ];

    return TimetableDTO(
      target: json['target'],
      type: json['type'],
      institute: json['institute'],
      weeks: weeks,
    );
  }
}
