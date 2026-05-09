import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:sfu/src/core/mock/mock_delay.dart';
import 'package:sfu/src/feature/events/data/dto/event_dto.dart';
import 'package:sfu/src/feature/events/data/data_source/remote/events_remote_data_source.dart';

class EventsRemoteDataSourceMock implements EventsRemoteDataSource {
  // Локальное состояние записей для имитации enroll/unenroll
  final Set<String> _enrolled = {'ev_2'};

  @override
  Future<List<EventDTO>> getEvents() async {
    await MockDelay.apply();

    final raw  = await rootBundle.loadString('lib/src/core/mock/events.json');
    final json = jsonDecode(raw) as Map<String, dynamic>;

    return (json['data'] as List).map((item) {
      final map = Map<String, dynamic>.from(item as Map);
      // Синхронизируем isEnrolled с локальным состоянием
      map['is_enrolled'] = _enrolled.contains(map['id']);
      return EventDTO.fromJson(map);
    }).toList();
  }

  @override
  Future<void> enrollEvent(String id) async {
    await MockDelay.apply();
    _enrolled.add(id);
  }

  @override
  Future<void> unenrollEvent(String id) async {
    await MockDelay.apply();
    _enrolled.remove(id);
  }
}