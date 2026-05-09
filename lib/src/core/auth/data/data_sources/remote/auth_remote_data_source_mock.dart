import 'package:sfu/src/core/auth/data/dto/auth_user_data.dart';
import 'package:sfu/src/core/auth/data/dto/token_dto.dart';
import 'package:sfu/src/core/auth/data/data_sources/remote/auth_remote_data_source.dart';

class AuthRemoteDataSourceMock implements AuthRemoteDataSource {
  // Тестовые пользователи
  final List<_UserMock> _items = [
    _UserMock(
      name: 'Тарас',
      login: 'user',
      password: '1234',
      groupName: 'КИ22-13Б',
      subgroup: '1 подгруппа',
      role: 'student',
    ),
    _UserMock(
      name: 'Соколова',
      login: 'teacher',
      password: '1234',
      groupName: 'Кафедра САИ',
      subgroup: '',
      role: 'teacher',
    ),
  ];

  _UserMock? _currentUser;

  static const _mockToken = TokenDTO(
    access: 'mock_access_token_sfu',
    refresh: 'mock_refresh_token_sfu',
    type: 'Bearer',
    expires: 3600,
  );

  @override
  Future<TokenDTO> signIn(String login, String password) async {
    await Future.delayed(const Duration(milliseconds: 900));

    final user = _items.firstWhere(
      (u) => u.login == login && u.password == password,
      orElse: () => throw Exception('Неверный логин или пароль'),
    );
    _currentUser = user;
    return _mockToken;
  }

  @override
  Future<TokenDTO> signUp(
    String login,
    String password,
    String name,
    String group,
    String subgroup,
    String role,
  ) async {
    await Future.delayed(const Duration(milliseconds: 900));

    final newUser = _UserMock(
      name: name,
      login: login,
      password: password,
      groupName: group,
      subgroup: subgroup,
      role: role,
    );
    _items.add(newUser);
    _currentUser = newUser;
    return _mockToken;
  }

  @override
  Future<void> resetPassword(String newPassword) async {
    await Future.delayed(const Duration(milliseconds: 900));
  }

  @override
  Future<TokenDTO> refreshToken(String token) async {
    await Future.delayed(const Duration(milliseconds: 600));
    return _mockToken;
  }

  @override
  Future<AuthMetadataDTO> getUserData(String uid) async {
    await Future.delayed(const Duration(milliseconds: 600));
    final user = _currentUser;
    if (user == null) throw Exception('Пользователь не найден');
    return AuthMetadataDTO(
      name: user.name,
      group: user.groupName,
      role: user.role,
      subgroup: user.subgroup,
    );
  }
}

class _UserMock {
  final String name;
  final String login;
  final String password;
  final String groupName;
  final String subgroup;
  final String role;

  const _UserMock({
    required this.name,
    required this.login,
    required this.password,
    required this.groupName,
    required this.subgroup,
    required this.role,
  });
}
