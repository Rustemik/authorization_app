import 'package:authorization_app/features/auth/domain/interfaces/i_users_repository.dart';
import 'package:authorization_app/features/auth/data/repository/user.dart';

class UsersRepository implements IUsersRepository {
  @override
  List<User> getAll() {
    return _users;
  }

  User? authenticate(String login, String password) {
    return _users.firstWhere(
      (user) => user.login == login && user.password == password,
      orElse: () => throw Exception('Пользователь не найден'),
    );
  }
}

List<User> _users = [
  User(
    login: 'Vlad',
    password: '1111',
  ),
  User(
    login: 'Vanya',
    password: '2222',
  ),
  User(
    login: 'Rustem',
    password: '3333',
  ),
];
