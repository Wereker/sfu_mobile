import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:sfu/src/core/mock/mock_delay.dart';
import 'package:sfu/src/feature/management/data/dto/managed_student_dto.dart';
import 'package:sfu/src/feature/management/data/dto/thesis_dto.dart';
import 'package:sfu/src/feature/management/data/data_source/remote/management_remote_data_source.dart';

class ManagementRemoteDataSourceMock implements ManagementRemoteDataSource {
  // Локальный список тем для имитации CRUD
  final List<ThesisDTO> _theses = [];
  bool _thesesLoaded = false;

  @override
  Future<List<ManagedStudentDTO>> getStudents({
    String? stream,
    String? groupId,
    String? search,
  }) async {
    await MockDelay.apply();

    final raw = await rootBundle.loadString('lib/src/core/mock/students.json');
    final json = jsonDecode(raw) as Map<String, dynamic>;

    var items = (json['data'] as List)
        .map((item) => ManagedStudentDTO.fromJson(item as Map<String, dynamic>))
        .toList();

    // Фильтрация прямо в mock
    if (stream != null && stream.isNotEmpty) {
      items = items.where((s) => s.stream == stream).toList();
    }
    if (groupId != null && groupId.isNotEmpty) {
      items = items.where((s) => s.groupId == groupId).toList();
    }
    if (search != null && search.isNotEmpty) {
      final q = search.toLowerCase();
      items = items
          .where(
            (s) =>
                s.name.toLowerCase().contains(q) ||
                s.groupName.toLowerCase().contains(q),
          )
          .toList();
    }
    return items;
  }

  @override
  Future<List<ThesisDTO>> getMyTheses() async {
    await MockDelay.apply();

    if (!_thesesLoaded) {
      final raw = await rootBundle.loadString('lib/src/core/mock/theses.json');
      final json = jsonDecode(raw) as Map<String, dynamic>;
      _theses.addAll(
        (json['data'] as List).map(
          (item) => ThesisDTO.fromJson(item as Map<String, dynamic>),
        ),
      );
      _thesesLoaded = true;
    }
    return List.unmodifiable(_theses);
  }

  @override
  Future<ThesisDTO> createThesis(String title) async {
    await MockDelay.apply();
    final newThesis = ThesisDTO(
      id: 'thesis_${DateTime.now().millisecondsSinceEpoch}',
      title: title,
      teacherId: 'teacher_current',
      teacherName: 'Вы',
      isFree: true,
    );
    _theses.add(newThesis);
    return newThesis;
  }

  @override
  Future<ThesisDTO> updateThesis(
    String id, {
    String? title,
    bool? isFree,
  }) async {
    await MockDelay.apply();
    final idx = _theses.indexWhere((t) => t.id == id);
    if (idx == -1) throw Exception('Тема $id не найдена');

    final updated = ThesisDTO(
      id: _theses[idx].id,
      title: title ?? _theses[idx].title,
      teacherId: _theses[idx].teacherId,
      teacherName: _theses[idx].teacherName,
      isFree: isFree ?? _theses[idx].isFree,
      takenBy: _theses[idx].takenBy,
      takenById: _theses[idx].takenById,
    );
    _theses[idx] = updated;
    return updated;
  }

  @override
  Future<void> createAnnouncement({
    required String title,
    required String body,
    required String audience,
    bool isPinned = false,
    String? stream,
    String? groupId,
    List<String> tags = const [],
  }) async {
    await MockDelay.apply();
    // В mock просто имитируем успех
  }

  @override
  Future<void> createEvent({
    required String title,
    required String body,
    required String date,
    required String time,
    required String location,
    required int totalSeats,
    required String audience,
    String? stream,
    String? groupId,
    List<String> tags = const [],
  }) async {
    await MockDelay.apply();
    // В mock просто имитируем успех
  }
}
