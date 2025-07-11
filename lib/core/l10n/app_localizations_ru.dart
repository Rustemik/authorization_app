// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get titleHello => 'Привет';

  @override
  String get titleAuth => 'Авторизация';

  @override
  String get titleLogin => 'Логин';

  @override
  String get titlePassword => 'Пароль';

  @override
  String get titleIncorrect => 'Неверный логин или пароль';

  @override
  String get titleHomePage => 'Главная страница';

  @override
  String get titleLoginButton => 'Войти';

  @override
  String get titleLogoutButton => 'Выйти';
}
