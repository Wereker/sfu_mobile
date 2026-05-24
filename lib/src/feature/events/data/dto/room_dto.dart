import 'package:freezed_annotation/freezed_annotation.dart';

part 'room_dto.freezed.dart';
part 'room_dto.g.dart';

@freezed
abstract class RoomDTO with _$RoomDTO {
  const factory RoomDTO({
    @JsonKey(fromJson: _intToString) required String id,
    required String number,
    required String address,
    required int capacity,
  }) = _RoomDTO;

  factory RoomDTO.fromJson(Map<String, dynamic> json) =>
      _$RoomDTOFromJson(json);
}

String _intToString(dynamic v) => v.toString();