import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:sfu/src/core/mock/mock_delay.dart';
import 'package:sfu/src/feature/announcements/data/dto/announcement_dto.dart';
import 'package:sfu/src/feature/announcements/data/data_source/remote/announcements_remote_data_source.dart';

class AnnouncementsRemoteDataSourceMock
    implements AnnouncementsRemoteDataSource {
  @override
  Future<List<AnnouncementDTO>> getAnnouncements() async {
    await MockDelay.apply();

    final raw = await rootBundle.loadString(
      'lib/src/core/mock/announcements.json',
    );
    final json = jsonDecode(raw) as Map<String, dynamic>;

    return (json['data'] as List)
        .map((item) => AnnouncementDTO.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}
