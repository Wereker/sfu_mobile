import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:sfu/src/feature/management/data/data_source/remote/management_remote_data_source.dart';
import 'package:sfu/src/feature/management/data/dto/managed_student_dto.dart';
import 'package:sfu/src/feature/management/data/dto/thesis_dto.dart';

class ManagementRemoteDataSourceMock implements ManagementRemoteDataSource {
  final List<ThesisDTO> _theses = [];
  bool _thesesLoaded = false;

  @override
  Future<List<ManagedStudentDTO>> getStudents({
    String? stream,
    String? groupId,
    String? search,
  }) async {
    await Future.delayed(const Duration(milliseconds: 600));
    final raw = await rootBundle.loadString('lib/src/core/mock/students.json');
    final list = jsonDecode(raw) as List<dynamic>;
    var result = list
        .map((e) => ManagedStudentDTO.fromJson(e as Map<String, dynamic>))
        .toList();

    if (groupId != null && groupId.isNotEmpty) {
      result = result.where((s) => s.groupId == groupId).toList();
    }
    if (search != null && search.isNotEmpty) {
      final q = search.toLowerCase();
      result = result.where((s) => s.name.toLowerCase().contains(q)).toList();
    }
    return result;
  }

  @override
  Future<List<ThesisDTO>> getMyTheses() async {
    await Future.delayed(const Duration(milliseconds: 600));
    if (!_thesesLoaded) {
      final raw = await rootBundle.loadString('lib/src/core/mock/theses.json');
      final list = jsonDecode(raw) as List<dynamic>;
      _theses.addAll(list.map((e) => ThesisDTO.fromJson(e as Map<String, dynamic>)));
      _thesesLoaded = true;
    }
    return List.of(_theses);
  }

  @override
  Future<ThesisDTO> createThesis(String title) async {
    await Future.delayed(const Duration(milliseconds: 400));
    final newId = (_theses.length + 100).toString();
    final dto = ThesisDTO(
      id: newId,
      title: title,
      teacherId: '1',
      teacherName: 'Администратор',
      isFree: true,
    );
    _theses.add(dto);
    return dto;
  }

  @override
  Future<ThesisDTO> updateThesis(String id, {String? title, bool? isFree}) async {
    await Future.delayed(const Duration(milliseconds: 400));
    final idx = _theses.indexWhere((t) => t.id == id);
    if (idx == -1) throw Exception('Thesis not found');
    final updated = _theses[idx].copyWith(
      title: title ?? _theses[idx].title,
      isFree: isFree ?? _theses[idx].isFree,
    );
    _theses[idx] = updated;
    return updated;
  }

  @override
  Future<void> createEvent({
    required String title,
    required String annotation,
    required String startsAt,
    required String endsAt,
    required int roomId,
  }) async {
    await Future.delayed(const Duration(milliseconds: 400));
  }

  @override
  Future<void> createAnnouncement({
    required String title,
    required String content,
    required String publishAt,
    required String expiresAt,
    required List<int> targetGroupIds,
    required List<int> targetStreamIds,
  }) async {
    await Future.delayed(const Duration(milliseconds: 400));
  }
}