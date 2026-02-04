// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'My App';

  @override
  String get loginTitle => 'Login';

  @override
  String get loginHint => 'Email';

  @override
  String get passwordHint => 'Password';

  @override
  String get signInButton => 'Sign In';

  @override
  String get forgotPassword => 'Forgot password?';
}
