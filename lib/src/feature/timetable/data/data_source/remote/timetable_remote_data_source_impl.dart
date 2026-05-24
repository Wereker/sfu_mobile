import 'package:dio/dio.dart';
import 'package:sfu/src/feature/timetable/data/data_source/remote/timetable_remote_data_source.dart';
import 'package:sfu/src/feature/timetable/data/dto/lesson_dto/lesson_dto.dart';
import 'package:sfu/src/feature/timetable/data/dto/timetable_dto/timetable_dto.dart';
import 'package:sfu/src/feature/timetable/data/dto/week_dto/week_dto.dart';

class TimetableRemoteDataSourceImpl implements TimetableRemoteDataSource {
  final Dio _authorizedClient;

  const TimetableRemoteDataSourceImpl({required Dio authorizedClient})
      : _authorizedClient = authorizedClient;

  @override
  Future<TimetableDTO> getTimetableForGroup(int groupId) =>
      _fetchByGroupId(groupId);

  @override
  Future<TimetableDTO> getTimetableForTeacher(int teacherId) =>
      _fetchByTeacherId(teacherId);

  @override
  Future<TimetableDTO> getTimetableForTarget({
    required int targetId,
    required TimetableTargetType type,
  }) =>
      type == TimetableTargetType.group
          ? _fetchByGroupId(targetId)
          : _fetchByTeacherId(targetId);

  Future<TimetableDTO> _fetchByGroupId(int groupId) async {
    final response = await _authorizedClient.get<List<dynamic>>(
      '/lessons/group/$groupId',
    );
    return _parseResponse(response.data ?? [], groupId.toString());
  }

  Future<TimetableDTO> _fetchByTeacherId(int teacherId) async {
    final response = await _authorizedClient.get<List<dynamic>>(
      '/lessons/teacher/$teacherId',
    );
    return _parseResponse(response.data ?? [], teacherId.toString());
  }

  TimetableDTO _parseResponse(List<dynamic> rawLessons, String targetId) {
    final Map<String, List<LessonDTO>> byWeek = {'1': [], '2': []};

    for (final lessonJson in rawLessons) {
      final lesson = LessonDTO.fromJson(lessonJson as Map<String, dynamic>);
      if (byWeek.containsKey(lesson.week)) {
        byWeek[lesson.week]!.add(lesson);
      }
    }

    return TimetableDTO(
      groupId: targetId,
      weeks: [
        WeekDTO(week: '1', lessons: byWeek['1']!),
        WeekDTO(week: '2', lessons: byWeek['2']!),
      ],
    );
  }
}