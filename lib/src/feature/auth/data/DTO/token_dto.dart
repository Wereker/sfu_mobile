import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_dto.freezed.dart';
part 'token_dto.g.dart';

@freezed
abstract class TokenDTO with _$TokenDTO {
  const factory TokenDTO({
    @JsonKey(name: "access_token") required String access,
    @JsonKey(name: "refresh_token") required String refresh,
    @JsonKey(name: "token_type") required String type,
    @JsonKey(name: "expires_in") required String expires,
  }) = _TokenDTO;

  factory TokenDTO.fromJson(Map<String, dynamic> json) => _$TokenDTOFromJson(json);
}
