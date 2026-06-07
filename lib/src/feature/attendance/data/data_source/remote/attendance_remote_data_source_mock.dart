import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:sfu/src/feature/attendance/data/data_source/remote/attendance_remote_data_source.dart';
import 'package:sfu/src/feature/attendance/data/dto/attendance_record_dto.dart';
import 'package:sfu/src/feature/attendance/data/dto/attendance_session_dto.dart';

class AttendanceRemoteDataSourceMock implements AttendanceRemoteDataSource {
  final _sessions = <int, AttendanceSessionDTO>{};
  final _manualRecords = <AttendanceRecordDTO>[];

  @override
  Future<AttendanceSessionDTO> createToken(int lessonId) async {
    await Future.delayed(const Duration(milliseconds: 400));
    final session = AttendanceSessionDTO(
      id: lessonId.toString(),
      lessonId: lessonId.toString(),
      token: 'mock-token-$lessonId-${DateTime.now().millisecondsSinceEpoch}',
      expiresAt: DateTime.now().add(const Duration(minutes: 5)).toIso8601String(),
      isActive: true,
    );
    _sessions[lessonId] = session;
    return session;
  }

  @override
  Future<AttendanceRecordDTO> markManual(int lessonId, int studentId) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final record = AttendanceRecordDTO(
      id: '${lessonId}_${studentId}_${DateTime.now().millisecondsSinceEpoch}',
      lessonId: lessonId.toString(),
      studentId: studentId.toString(),
      markedVia: 'manual',
      createdAt: DateTime.now().toIso8601String(),
    );
    _manualRecords.add(record);
    return record;
  }

  @override
  Future<List<AttendanceRecordDTO>> getLessonAttendance(int lessonId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final raw = await rootBundle.loadString('lib/src/core/mock/attendance_records.json');
    final json = jsonDecode(raw) as Map<String, dynamic>;
    final list = (json['lesson_1'] as List<dynamic>? ?? [])
        .map((e) => AttendanceRecordDTO.fromJson(e as Map<String, dynamic>))
        .toList();
    return [...list, ..._manualRecords.where((r) => r.lessonId == lessonId.toString())];
  }

  @override
  Future<AttendanceRecordDTO> scanToken(String token) async {
    await Future.delayed(const Duration(milliseconds: 400));
    return AttendanceRecordDTO(
      id: 'scan_${DateTime.now().millisecondsSinceEpoch}',
      lessonId: '13',
      studentId: '4',
      markedVia: 'qr',
      createdAt: DateTime.now().toIso8601String(),
    );
  }

  @override
  Future<List<AttendanceRecordDTO>> getStudentHistory(int studentId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final raw = await rootBundle.loadString('lib/src/core/mock/attendance_records.json');
    final json = jsonDecode(raw) as Map<String, dynamic>;
    final key = 'student_$studentId';
    final list = (json[key] as List<dynamic>? ?? [])
        .map((e) => AttendanceRecordDTO.fromJson(e as Map<String, dynamic>))
        .toList();
    return list;
  }
}