import 'package:flutter/material.dart';
import 'package:sfu/src/app/app.dart';
import 'package:sfu/src/core/dependency_injection/injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  runApp(const App());
}
