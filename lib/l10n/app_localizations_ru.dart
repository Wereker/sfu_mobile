// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appName => 'Моё приложение';

  @override
  String get loginTitle => 'Вход';

  @override
  String get loginHint => 'Электронная почта';

  @override
  String get passwordHint => 'Пароль';

  @override
  String get signInButton => 'Войти';

  @override
  String get forgotPassword => 'Забыли пароль?';
}
