import 'package:sfu/src/core/auth/data/DTO/token_dto.dart';
import 'package:sfu/src/core/auth/data/data_sources/remote/auth_remote_data_source.dart';

class AuthRemoteDataSourceMock implements AuthRemoteDataSource {
  final List<_UserMock> _items = [
    _UserMock(
      login: 'user',
      password: '1234',
      group: 'КИ22-13Б',
      subgroup: '1 подгруппа',
      role: 'student',
      token: TokenDTO(
        access: "i0L7CtovHpaCCDlsY22ObO4qACz57Khr",
        refresh: "dyqcelydolMLJQbT68x2EB9VqvvgMQmT",
        type: "Bearer",
        expires: "3600",
      ),
    ),
  ];

  _UserMock _currentUser = _UserMock(
    login: 'user',
    password: '1234',
    group: 'КИ22-13Б',
    subgroup: '1 подгруппа',
    role: 'student',
    token: TokenDTO(
      access: "i0L7CtovHpaCCDlsY22ObO4qACz57Khr",
      refresh: "dyqcelydolMLJQbT68x2EB9VqvvgMQmT",
      type: "Bearer",
      expires: "3600",

    ),
  );

  @override
  Future<TokenDTO> signIn(String login, String password) async {
    await Future.delayed(const Duration(seconds: 1));

    final _UserMock? user = _items
        .where((item) => item.password == password && item.login == login)
        .firstOrNull;

    if (user != null) {
      _currentUser = user;
      return user.token;
    }

    throw Exception();
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
    await Future.delayed(const Duration(seconds: 1));

    final _UserMock newUser = _UserMock(
      login: 'user',
      password: '1234',
      group: group,
      subgroup: subgroup,
      role: 'student',
      token: TokenDTO(
        access: "i0L7CtovHpaCCDlsY22ObO4qACz57Khr",
        refresh: "dyqcelydolMLJQbT68x2EB9VqvvgMQmT",
        type: "Bearer",
        expires: "3600",
      ),
    );
    _items.add(newUser);
    return newUser.token;
  }

  @override
  Future<TokenDTO> resetPassword(String password, String newPassword) async {
    await Future.delayed(const Duration(seconds: 1));

    _UserMock? user = _items
        .where((item) => item.password == password)
        .firstOrNull;

    if (user != null) {
      final index = _items.indexOf(user);
      _items[index] = _UserMock(
        login: user.login,
        password: newPassword,
        token: user.token,
        group: user.group,
        subgroup: user.subgroup,
        role: user.role,
      );

      _currentUser = _items[index];
      return _items[index].token;
    }

    throw Exception();
  }

  @override
  Future<TokenDTO> refreshToken(String token) async {
    await Future.delayed(const Duration(seconds: 1));
    return TokenDTO(
      access: "i0L7CtovHpaCCDlsY22ObO4qACz57Khr",
      refresh: "dyqcelydolMLJQbT68x2EB9VqvvgMQmT",
      type: "Bearer",
      expires: "3600",
    );
  }

  @override
  Future<String> getUserGroup() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _currentUser.group;
  }

  @override
  Future<String> getUserRole() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _currentUser.role;
  }

  @override
  Future<String> getUserSubgroup() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _currentUser.subgroup;
  }
}

class _UserMock {
  final String login;
  final String password;
  final String group;
  final String subgroup;
  final String role;
  final TokenDTO token;

  const _UserMock({
    required this.login,
    required this.password,
    required this.token,
    required this.group,
    required this.subgroup,
    required this.role,
  });
}
