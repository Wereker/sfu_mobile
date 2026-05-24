import 'package:sfu/src/feature/profile/data/dto/user_dto.dart';
import 'package:sfu/src/feature/profile/domain/entity/user.dart';

abstract class UserMapper {
  static User fromDTO(UserDTO dto) {
    final role = _parseRole(dto.role);

    return User(
      id: dto.id,
      firstName: dto.firstName,
      lastName: dto.lastName,
      fatherName: dto.fatherName,
      email: dto.email,
      role: role,
      isActive: dto.isActive,
      avatarUrl: dto.avatarUrl,
      createdAt: DateTime.parse(dto.createdAt),
      updatedAt: DateTime.parse(dto.updatedAt),

      phone: '+7 913 345 18 25',
      birthdate: DateTime(2003, 4, 15),
      sex: 'male',
      institute: 'ИКИТ СФУ',
      groupId: '5',
      groupName: 'КИ22-13Б',
      stream: 'ИСИТ',
      subgroup: '1',
      recordBookNumber: '032049803',

      // Преподавательские поля — только если teacher
      position: role == UserRole.teacher ? 'доцент' : null,
      degree: role == UserRole.teacher ? 'к.т.н.' : null,
      department: role == UserRole.teacher ? 'Системы искусственного интеллекта' : null,
      bio: role == UserRole.teacher
          ? 'Занимается исследованиями в области машинного обучения'
          : null,
      tags: role == UserRole.teacher
          ? ['Machine Learning', 'Frontend', 'Python']
          : [],
      telegram: '@ivanov_sfu',
      notifyChats:  true,
      notifyNews:   true,
      notifyEvents: false,
    );
  }

  static UserRole _parseRole(String raw) {
    switch (raw) {
      case 'student': return UserRole.student;
      case 'teacher': return UserRole.teacher;
      case 'admin':   return UserRole.admin;
      default:        return UserRole.unknown;
    }
  }
}
