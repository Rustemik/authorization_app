// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get titleHello => 'Hello';

  @override
  String get titleAuth => 'Authorization';

  @override
  String get titleLogin => 'Login';

  @override
  String get titlePassword => 'Password';

  @override
  String get titleIncorrect => 'Incorrect login or password';

  @override
  String get titleHomePage => 'Home Page';

  @override
  String get titleLoginButton => 'Login';

  @override
  String get titleLogoutButton => 'Logout';
}
