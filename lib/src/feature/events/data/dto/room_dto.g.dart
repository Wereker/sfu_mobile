// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RoomDTO _$RoomDTOFromJson(Map<String, dynamic> json) => _RoomDTO(
  id: _intToString(json['id']),
  number: json['number'] as String,
  address: json['address'] as String,
  capacity: (json['capacity'] as num).toInt(),
);

Map<String, dynamic> _$RoomDTOToJson(_RoomDTO instance) => <String, dynamic>{
  'id': instance.id,
  'number': instance.number,
  'address': instance.address,
  'capacity': instance.capacity,
};
