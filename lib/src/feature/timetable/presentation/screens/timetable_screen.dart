import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sfu/src/app/dependency_injection/injection.dart' as di;
import 'package:sfu/src/core/localization/app_localizations.dart';
import 'package:sfu/src/core/widgets/loading_indicator_widget.dart';
import 'package:sfu/src/feature/timetable/domain/entity/lesson/lesson.dart';
import 'package:sfu/src/feature/timetable/domain/entity/timetable/timetable.dart';
import 'package:sfu/src/feature/timetable/presentation/bloc/timetable_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sfu/src/feature/timetable/suggestion/presentation/bloc/suggestions_bloc.dart';
import 'package:sfu/src/feature/timetable/suggestion/presentation/widgets/timetable_search_bar.dart';

part '../widgets/day_lessons_card.dart';
part '../widgets/lesson_item.dart';
part '../widgets/timetable_content.dart';

class TimetableScreen extends StatelessWidget {
  const TimetableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<TimetableBloc>()..add(TimetableEvent.loadData())),
        BlocProvider(create: (_) => di.sl<SuggestionsBloc>()..add(SuggestionEvent.loadData())),
      ],
      child: Scaffold(
        body: _TimetableContent(),
      ),
    );
  }
}