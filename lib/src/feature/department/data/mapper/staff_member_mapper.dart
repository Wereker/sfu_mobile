import 'package:sfu/src/feature/department/data/dto/staff_member_dto.dart';
import 'package:sfu/src/feature/department/domain/entity/staff_member.dart';

abstract class StaffMemberMapper {
  static StaffMember fromDTO(StaffMemberDTO dto) => StaffMember(
    id:        dto.id,
    name:      dto.name,
    position:  dto.position,
    degree:    dto.degree,
    email:     dto.email,
    phone:     dto.phone,
    telegram:  dto.telegram,
    office:    dto.office,
    bio:       dto.bio,
    tags:      dto.tags,
    avatarUrl: dto.avatarUrl,
  );
}