import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sfu/src/app/dependency_injection/injection.dart' as di;
import 'package:sfu/src/core/localization/app_localizations.dart';
import 'package:sfu/src/core/widgets/loading_indicator_widget.dart';
import 'package:sfu/src/feature/timetable/domain/entity/lesson/lesson.dart';
import 'package:sfu/src/feature/timetable/domain/entity/timetable/timetable.dart';
import 'package:sfu/src/feature/timetable/presentation/bloc/timetable_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sfu/src/feature/timetable/presentation/widgets/timetable_search_bar.dart';

part '../widgets/day_lessons_card.dart';
part '../widgets/lesson_item.dart';
part '../widgets/timetable_content.dart';

class TimetableScreen extends StatelessWidget {
  const TimetableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return BlocProvider(
      create: (context) =>
          di.sl<TimetableBloc>()..add(TimetableEvent.loadData()),
      child: Scaffold(
        body: BlocBuilder<TimetableBloc, TimetableState>(
          builder: (BuildContext context, TimetableState state) {
            return state.maybeWhen(
              loading: () =>
                  Center(child: LoadingIndicatorWidget()),
              success: (timetable) => _TimetableContent(timetable: timetable),
              error: (message) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error, size: 48, color: Colors.red),
                    const SizedBox(height: 16),
                    Text('${t!.timetableError}: $message', textAlign: TextAlign.center),
                  ],
                ),
              ),
              orElse: () => Center(child: Text(t!.timetableNotFoundData)),
            );
          },
        ),
      ),
    );
  }
}