import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sfu/src/app/dependency_injection/injection.dart';
import 'package:sfu/src/core/l10n/strings.g.dart';
import 'package:sfu/src/feature/management/presentation/bloc/publish/publish_bloc.dart';
import 'package:sfu/src/feature/management/presentation/bloc/students/students_bloc.dart';
import 'package:sfu/src/feature/management/presentation/bloc/theses/theses_bloc.dart';
import 'package:sfu/src/feature/management/presentation/widgets/management_app_bar.dart';
import 'package:sfu/src/feature/management/presentation/widgets/management_segmented_control.dart';
import 'package:sfu/src/feature/management/presentation/widgets/publish_tab.dart';
import 'package:sfu/src/feature/management/presentation/widgets/students_tab.dart';
import 'package:sfu/src/feature/management/presentation/widgets/theses_tab.dart';

class ManagementScreen extends StatefulWidget {
  const ManagementScreen({super.key});

  @override
  State<ManagementScreen> createState() => _ManagementScreenState();
}

class _ManagementScreenState extends State<ManagementScreen> {
  int _tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final tabs = [t.management.tabStudents, t.management.tabPublish, t.management.tabTheses];

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => sl<StudentsBloc>()
            ..add(const StudentsEvent.load()),
        ),
        BlocProvider(
          create: (_) => sl<ThesesBloc>()
            ..add(const ThesesEvent.load()),
        ),
        BlocProvider(
          create: (_) => sl<PublishBloc>(),
        ),
      ],
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            const ManagementAppBar(),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                child: ManagementSegmentedControl(
                  tabs: tabs,
                  selected: _tabIndex,
                  onChanged: (i) => setState(() => _tabIndex = i),
                ),
              ),
            ),

            switch (_tabIndex) {
              0 => const StudentsTab(),
              1 => const PublishTab(),
              _ => const ThesesTab(),
            },
          ],
        ),
      ),
    );
  }
}