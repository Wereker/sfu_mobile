import 'package:dio/dio.dart';
import 'package:sfu/src/feature/announcements/data/data_source/remote/announcements_remote_data_source.dart';
import 'package:sfu/src/feature/announcements/data/dto/announcement_dto.dart';

class AnnouncementsRemoteDataSourceImpl
    implements AnnouncementsRemoteDataSource {
  final Dio _authorizedClient;

  const AnnouncementsRemoteDataSourceImpl({required Dio authorizedClient})
      : _authorizedClient = authorizedClient;

  @override
  Future<List<AnnouncementDTO>> getAnnouncements() async {
    final response =
    await _authorizedClient.get<List<dynamic>>('/announcements');
    final data = response.data ?? [];
    return data
        .map((e) => AnnouncementDTO.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}