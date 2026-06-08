import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sfu/src/app/app.dart';
import 'package:sfu/src/app/dependency_injection/injection.dart' as di;
import 'package:sfu/src/core/auth/presentation/bloc/auth_bloc.dart';
import 'package:sfu/src/core/l10n/strings.g.dart';
import 'package:sfu/src/feature/announcements/presentation/bloc/announcements_bloc.dart';
import 'package:sfu/src/feature/events/presentation/bloc/events_bloc.dart';
import 'package:sfu/src/feature/profile/presentation/bloc/profile_bloc.dart';
import 'package:sfu/src/feature/settings/presentation/bloc/settings_bloc.dart';
import 'package:sfu/src/feature/timetable/presentation/bloc/timetable_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  await di.init();
  LocaleSettings.useDeviceLocale();

  runApp(
    TranslationProvider(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => di.sl<AuthBloc>()..add(AuthEvent.checkAuthStatus()),
          ),
          BlocProvider(
            create: (_) =>
            di.sl<SettingsBloc>()..add(SettingsEvent.getAppSettings()),
          ),
          BlocProvider(create: (_) => di.sl<ProfileBloc>()),
          BlocProvider(create: (_) => di.sl<AnnouncementsBloc>()),
          BlocProvider(create: (_) => di.sl<EventsBloc>()),
          BlocProvider(create: (_) => di.sl<TimetableBloc>())
        ],
        child: const App(),
      ),
    ),
  );
}