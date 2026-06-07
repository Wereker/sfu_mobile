import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:sfu/src/feature/timetable/data/data_source/remote/timetable_remote_data_source.dart';
import 'package:sfu/src/feature/timetable/data/dto/lesson_dto/lesson_dto.dart';
import 'package:sfu/src/feature/timetable/data/dto/timetable_dto/timetable_dto.dart';
import 'package:sfu/src/feature/timetable/data/dto/week_dto/week_dto.dart';

class TimetableRemoteDataSourceMock implements TimetableRemoteDataSource {
  @override
  Future<TimetableDTO> getTimetableForGroup(int groupId) => _load(groupId.toString());

  @override
  Future<TimetableDTO> getTimetableForTeacher(int teacherId) => _load(teacherId.toString());

  @override
  Future<TimetableDTO> getTimetableForTarget({
    required int targetId,
    required TimetableTargetType type,
  }) => _load(targetId.toString());

  Future<TimetableDTO> _load(String targetId) async {
    await Future.delayed(const Duration(milliseconds: 600));
    final raw = await rootBundle.loadString('lib/src/core/mock/timetable.json');
    final list = jsonDecode(raw) as List<dynamic>;

    final byWeek = <String, List<LessonDTO>>{'1': [], '2': []};
    for (final item in list) {
      final lesson = LessonDTO.fromJson(item as Map<String, dynamic>);
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