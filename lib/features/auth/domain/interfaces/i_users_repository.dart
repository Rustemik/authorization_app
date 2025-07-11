import 'package:authorization_app/features/auth/data/repository/user.dart';

abstract class IUsersRepository {
  List<User> getAll();
}
