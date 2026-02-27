import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'localization/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ru'),
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'My App'**
  String get appName;

  /// No description provided for @appError.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get appError;

  /// No description provided for @appRepeatTry.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get appRepeatTry;

  /// No description provided for @authLoginTitle.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get authLoginTitle;

  /// No description provided for @authNameHint.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get authNameHint;

  /// No description provided for @authSurnameHint.
  ///
  /// In en, this message translates to:
  /// **'Surname'**
  String get authSurnameHint;

  /// No description provided for @authLoginHint.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get authLoginHint;

  /// No description provided for @authPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get authPasswordHint;

  /// No description provided for @authPasswordRepeatHint.
  ///
  /// In en, this message translates to:
  /// **'Repeat Password'**
  String get authPasswordRepeatHint;

  /// No description provided for @authSignInButton.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get authSignInButton;

  /// No description provided for @authSignUpButton.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get authSignUpButton;

  /// No description provided for @authResetPasswordButton.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get authResetPasswordButton;

  /// No description provided for @authForgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get authForgotPassword;

  /// No description provided for @homeAppBarNews.
  ///
  /// In en, this message translates to:
  /// **'News'**
  String get homeAppBarNews;

  /// No description provided for @homeAppBarTimetable.
  ///
  /// In en, this message translates to:
  /// **'Timetable'**
  String get homeAppBarTimetable;

  /// No description provided for @homeAppBarChat.
  ///
  /// In en, this message translates to:
  /// **'Chat'**
  String get homeAppBarChat;

  /// No description provided for @profileStudentNumber.
  ///
  /// In en, this message translates to:
  /// **'Student number'**
  String get profileStudentNumber;

  /// No description provided for @profileGradeBook.
  ///
  /// In en, this message translates to:
  /// **'Grade book'**
  String get profileGradeBook;

  /// No description provided for @profileListOrders.
  ///
  /// In en, this message translates to:
  /// **'List of orders'**
  String get profileListOrders;

  /// No description provided for @profileStudyPlan.
  ///
  /// In en, this message translates to:
  /// **'Study plan'**
  String get profileStudyPlan;

  /// No description provided for @profileSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get profileSettings;

  /// No description provided for @profileLogout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get profileLogout;

  /// No description provided for @settingsLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settingsLanguage;

  /// No description provided for @settingsTheme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get settingsTheme;

  /// No description provided for @settingsThemeSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get settingsThemeSystem;

  /// No description provided for @settingsThemeLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get settingsThemeLight;

  /// No description provided for @settingsThemeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get settingsThemeDark;

  /// No description provided for @timetableError.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get timetableError;

  /// No description provided for @timetableNotFoundData.
  ///
  /// In en, this message translates to:
  /// **'Not found data'**
  String get timetableNotFoundData;

  /// No description provided for @timetableNoLessonsThisWeek.
  ///
  /// In en, this message translates to:
  /// **'No lesson on this week'**
  String get timetableNoLessonsThisWeek;

  /// No description provided for @timetableNoLessonsThisDay.
  ///
  /// In en, this message translates to:
  /// **'No lesson'**
  String get timetableNoLessonsThisDay;

  /// No description provided for @timetableOddWeek.
  ///
  /// In en, this message translates to:
  /// **'odd'**
  String get timetableOddWeek;

  /// No description provided for @timetableEvenWeek.
  ///
  /// In en, this message translates to:
  /// **'even'**
  String get timetableEvenWeek;

  /// No description provided for @timetableMonday.
  ///
  /// In en, this message translates to:
  /// **'Monday'**
  String get timetableMonday;

  /// No description provided for @timetableTuesday.
  ///
  /// In en, this message translates to:
  /// **'Tuesday'**
  String get timetableTuesday;

  /// No description provided for @timetableWednesday.
  ///
  /// In en, this message translates to:
  /// **'Wednesday'**
  String get timetableWednesday;

  /// No description provided for @timetableThursday.
  ///
  /// In en, this message translates to:
  /// **'Thursday'**
  String get timetableThursday;

  /// No description provided for @timetableFriday.
  ///
  /// In en, this message translates to:
  /// **'Friday'**
  String get timetableFriday;

  /// No description provided for @timetableSaturday.
  ///
  /// In en, this message translates to:
  /// **'Saturday'**
  String get timetableSaturday;

  /// No description provided for @timetableSunday.
  ///
  /// In en, this message translates to:
  /// **'Sunday'**
  String get timetableSunday;

  /// No description provided for @timetableDay.
  ///
  /// In en, this message translates to:
  /// **'Day'**
  String get timetableDay;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ru':
      return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
