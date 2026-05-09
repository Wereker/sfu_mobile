import 'dart:convert';
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:sfu/src/core/mock/mock_delay.dart';
import 'package:sfu/src/feature/attendance/data/dto/attendance_record_dto.dart';
import 'package:sfu/src/feature/attendance/data/dto/attendance_session_dto.dart';
import 'package:sfu/src/feature/attendance/data/dto/attendance_student_dto.dart';
import 'package:sfu/src/feature/attendance/data/data_source/remote/attendance_remote_data_source.dart';

class AttendanceRemoteDataSourceMock implements AttendanceRemoteDataSource {
  // Локальное состояние студентов сессии для ручной отметки
  final Map<String, List<AttendanceStudentDTO>> _sessions = {};

  @override
  Future<AttendanceSessionDTO> createSession(
    String lessonId,
    int ttlSeconds,
  ) async {
    await MockDelay.apply();

    final sessionId = 'session_${Random().nextInt(99999)}';
    final token =
        'mock_qr_${lessonId}_${DateTime.now().millisecondsSinceEpoch}';
    final expiresAt = DateTime.now().add(Duration(seconds: ttlSeconds));

    // Загружаем студентов для этой сессии
    final raw = await rootBundle.loadString(
      'lib/src/core/mock/attendance_students.json',
    );
    final json = jsonDecode(raw) as Map<String, dynamic>;
    _sessions[sessionId] = (json['data'] as List)
        .map(
          (item) => AttendanceStudentDTO.fromJson(item as Map<String, dynamic>),
        )
        .toList();

    return AttendanceSessionDTO(
      sessionId: sessionId,
      token: token,
      expiresAt: expiresAt.toIso8601String(),
    );
  }

  @override
  Future<void> closeSession(String sessionId) async {
    await MockDelay.apply();
    _sessions.remove(sessionId);
  }

  @override
  Future<List<AttendanceStudentDTO>> getSessionStudents(
    String sessionId,
  ) async {
    await MockDelay.apply();
    return _sessions[sessionId] ?? [];
  }

  @override
  Future<AttendanceStudentDTO> updateStudentStatus(
    String sessionId,
    String studentId,
    String status,
  ) async {
    await MockDelay.apply();

    final students = _sessions[sessionId];
    if (students == null) throw Exception('Сессия $sessionId не найдена');

    final idx = students.indexWhere((s) => s.id == studentId);
    if (idx == -1) throw Exception('Студент $studentId не найден');

    final updated = AttendanceStudentDTO(
      id: students[idx].id,
      name: students[idx].name,
      isHeadman: students[idx].isHeadman,
      status: status,
      markedAt: DateTime.now().toIso8601String(),
    );
    students[idx] = updated;
    return updated;
  }

  @override
  Future<AttendanceRecordDTO> markAttendance(String token) async {
    await MockDelay.apply();

    // Просто имитируем успешную отметку
    return AttendanceRecordDTO(
      id: 'ar_${Random().nextInt(99999)}',
      lesson: 'Машинное обучение',
      date: DateTime.now().toIso8601String().substring(0, 10),
      status: 'present',
      markedAt: DateTime.now().toIso8601String(),
    );
  }

  @override
  Future<List<AttendanceRecordDTO>> getAttendanceHistory() async {
    await MockDelay.apply();

    final raw = await rootBundle.loadString(
      'lib/src/core/mock/attendance_records.json',
    );
    final json = jsonDecode(raw) as Map<String, dynamic>;

    return (json['data'] as List)
        .map(
          (item) => AttendanceRecordDTO.fromJson(item as Map<String, dynamic>),
        )
        .toList();
  }
}
