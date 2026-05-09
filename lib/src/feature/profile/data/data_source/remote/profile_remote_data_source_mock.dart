import 'package:sfu/src/core/mock/mock_delay.dart';
import 'package:sfu/src/feature/profile/data/dto/user_dto.dart';
import 'package:sfu/src/feature/profile/data/data_source/remote/profile_remote_data_source.dart';

class ProfileRemoteDataSourceMock implements ProfileRemoteDataSource {
  @override
  Future<UserDTO> getProfile() async {
    await MockDelay.apply();

    // Студент
    return const UserDTO(
      id: 'user_current',
      firstName: 'Тарас',
      lastName: 'Бубля',
      fatherName: 'Олегович',
      phone: '+7 913 345 18 25',
      role: 'student',
      institute: 'ИКИТ',
      groupId: 'g1',
      groupName: 'КИ22-13Б',
      stream: 'КИ22',
      subgroup: '1',
      recordBookNumber: '032049803',
    );

    // Преподаватель
    // return const UserDTO(
    //   id:        'teacher_1',
    //   firstName: 'Елена',
    //   lastName:  'Соколова',
    //   fatherName:'Викторовна',
    //   phone:     '+7 391 206 22 11',
    //   role:      'teacher',
    //   institute: 'ИКИТ',
    //   position:  'Доцент, зам. зав. кафедрой',
    //   degree:    'к.т.н.',
    //   office:    'Л4-309',
    //   bio:       'Кандидат технических наук.',
    //   tags:      ['ML', 'NLP'],
    // );
  }
}
