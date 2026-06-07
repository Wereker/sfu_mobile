import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:sfu/src/feature/events/data/data_source/remote/events_remote_data_source.dart';
import 'package:sfu/src/feature/events/data/dto/event_dto.dart';

class EventsRemoteDataSourceMock implements EventsRemoteDataSource {
  final _enrolled = <String>{};

  @override
  Future<List<EventDTO>> getEvents() async {
    await Future.delayed(const Duration(milliseconds: 600));
    final raw = await rootBundle.loadString('lib/src/core/mock/events.json');
    final list = jsonDecode(raw) as List<dynamic>;
    return list.map((e) => EventDTO.fromApiJson(e as Map<String, dynamic>)).toList();
  }

  @override
  Future<void> enrollEvent(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    _enrolled.add(id);
  }

  @override
  Future<void> unenrollEvent(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    _enrolled.remove(id);
  }
}