import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sfu/src/app/dependency_injection/injection.dart' as di;
import 'package:sfu/src/feature/timetable/presentation/bloc/timetable_bloc.dart';
import 'package:sfu/src/feature/timetable/presentation/widgets/timetable_content.dart';
import 'package:sfu/src/feature/timetable/suggestion/presentation/bloc/suggestions_bloc.dart';

class TimetableScreen extends StatelessWidget {
  const TimetableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.sl<TimetableBloc>()..add(TimetableEvent.loadData()),
        ),
        BlocProvider(
          create: (_) =>
              di.sl<SuggestionsBloc>()..add(SuggestionEvent.loadData()),
        ),
      ],
      child: const Scaffold(body: TimetableContent()),
    );
  }
}
