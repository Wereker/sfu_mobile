import 'package:dio/dio.dart';
import 'package:sfu/src/feature/events/data/data_source/remote/events_remote_data_source.dart';
import 'package:sfu/src/feature/events/data/dto/event_dto.dart';

class EventsRemoteDataSourceImpl implements EventsRemoteDataSource {
  final Dio _authorizedClient;

  const EventsRemoteDataSourceImpl({required Dio authorizedClient})
      : _authorizedClient = authorizedClient;

  @override
  Future<List<EventDTO>> getEvents() async {
    final response = await _authorizedClient.get<List<dynamic>>('/events');
    final data = response.data ?? [];
    return data
        .map((e) => EventDTO.fromApiJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<void> enrollEvent(String id) async {
    await _authorizedClient.post<void>('/events/$id/enroll');
  }

  @override
  Future<void> unenrollEvent(String id) async {
    await _authorizedClient.delete<void>('/events/$id/enroll');
  }
}