import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sfu/src/app/app.dart';
import 'package:sfu/src/core/dependency_injection/injection.dart' as di;
import 'package:sfu/src/feature/auth/presentation/bloc/auth_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  runApp(
    BlocProvider<AuthBloc>(
      create: (context) => di.sl<AuthBloc>()..add(AuthEvent.checkAuthStatus()),
      child: const App(),
    ),
  );
}
