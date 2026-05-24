import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sfu/src/app/dependency_injection/injection.dart' as di;
import 'package:sfu/src/feature/profile/domain/entity/user.dart';
import 'package:sfu/src/feature/profile/presentation/bloc/profile_bloc.dart';
import 'package:sfu/src/feature/timetable/data/data_source/remote/timetable_remote_data_source.dart';
import 'package:sfu/src/feature/timetable/presentation/bloc/timetable_bloc.dart';
import 'package:sfu/src/feature/timetable/presentation/widgets/timetable_content.dart';
import 'package:sfu/src/feature/timetable/suggestion/presentation/bloc/suggestions_bloc.dart';

class TimetableScreen extends StatelessWidget {
  const TimetableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di.sl<SuggestionsBloc>()..add(SuggestionEvent.loadData()),
      child: BlocListener<ProfileBloc, ProfileState>(
        listener: (context, profileState) {
          profileState.maybeWhen(
            success: (user) => _loadTimetable(context, user),
            orElse: () {},
          );
        },
        child: Builder(
          builder: (context) {
            final profileState = context.read<ProfileBloc>().state;
            profileState.maybeWhen(
              success: (user) => WidgetsBinding.instance.addPostFrameCallback(
                (_) => _loadTimetable(context, user),
              ),
              orElse: () {},
            );
            return const Scaffold(body: TimetableContent());
          },
        ),
      ),
    );
  }

  void _loadTimetable(BuildContext context, User user) {
    final isTeacher =
        user.role == UserRole.teacher || user.role == UserRole.admin;

    final targetId = isTeacher
        ? user.id
        : int.tryParse(user.groupId ?? '') ?? 0;

    final type = isTeacher
        ? TimetableTargetType.teacher
        : TimetableTargetType.group;

    context.read<TimetableBloc>().add(
      TimetableEvent.loadData(userId: targetId, userType: type),
    );
  }
}
