import 'package:sfu/src/feature/profile/data/dto/user_dto.dart';
import 'package:sfu/src/feature/profile/domain/entity/user.dart';

abstract class UserMapper {
  static User fromDTO(UserDTO dto) => User(
    id: dto.id,
    firstName: dto.firstName,
    lastName: dto.lastName,
    fatherName: dto.fatherName,
    birthdate: dto.birthdate,
    sex: dto.sex,
    phone: dto.phone,
    role: dto.role,
    avatarUrl: dto.avatarUrl,
    institute: dto.institute,
    groupId: dto.groupId,
    groupName: dto.groupName,
    stream: dto.stream,
    subgroup: dto.subgroup,
    recordBookNumber: dto.recordBookNumber,
    position: dto.position,
    degree: dto.degree,
    office: dto.office,
    bio: dto.bio,
    tags: dto.tags,
  );
}
