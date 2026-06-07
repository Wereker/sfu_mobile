import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:sfu/src/feature/announcements/data/data_source/remote/announcements_remote_data_source.dart';
import 'package:sfu/src/feature/announcements/data/dto/announcement_dto.dart';

class AnnouncementsRemoteDataSourceMock implements AnnouncementsRemoteDataSource {
  @override
  Future<List<AnnouncementDTO>> getAnnouncements() async {
    await Future.delayed(const Duration(milliseconds: 600));
    final raw = await rootBundle.loadString('lib/src/core/mock/announcements.json');
    final list = jsonDecode(raw) as List<dynamic>;
    return list.map((e) => AnnouncementDTO.fromJson(e as Map<String, dynamic>)).toList();
  }
}