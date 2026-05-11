import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_user_data.freezed.dart';
part 'auth_user_data.g.dart';

@freezed
abstract class AuthMetadataDTO with _$AuthMetadataDTO {
  const factory AuthMetadataDTO({
    String? name,
    String? group,
    String? role,
    String? subgroup,
  }) = _AuthMetadataDTO;

  factory AuthMetadataDTO.fromJson(Map<String, dynamic> json) =>
      _$AuthMetadataDTOFromJson(json);
}
