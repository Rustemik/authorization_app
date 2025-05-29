import 'package:authorization_app/repository/user.dart';

abstract class IUsersRepository {
  List<User> getAll();
}
