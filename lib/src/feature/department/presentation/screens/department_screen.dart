import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sfu/src/app/dependency_injection/injection.dart';
import 'package:sfu/src/core/l10n/strings.g.dart';
import 'package:sfu/src/feature/department/presentation/bloc/department_bloc.dart';
import 'package:sfu/src/feature/department/presentation/widgets/department_app_bar.dart';
import 'package:sfu/src/feature/department/presentation/widgets/department_segmented_control.dart';
import 'package:sfu/src/feature/department/presentation/widgets/disciplines_tab.dart';
import 'package:sfu/src/feature/department/presentation/widgets/staff_tab.dart';
import 'package:sfu/src/feature/department/presentation/widgets/thesis_tab.dart';

class DepartmentScreen extends StatefulWidget {
  const DepartmentScreen({super.key});

  @override
  State<DepartmentScreen> createState() => _DepartmentScreenState();
}

class _DepartmentScreenState extends State<DepartmentScreen> {
  int _tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final tabs = [t.department.tabStaff, t.department.tabTheses, t.department.tabDisciplines];

    return BlocProvider(
      create: (_) => sl<DepartmentBloc>()..add(const DepartmentEvent.load()),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            const DepartmentAppBar(),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                    child: DepartmentSegmentedControl(
                      tabs: tabs,
                      selected: _tabIndex,
                      onChanged: (i) => setState(() => _tabIndex = i),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
              sliver: switch (_tabIndex) {
                0 => const StaffTab(),
                1 => const ThesisTab(),
                _ => const DisciplinesTab(),
              },
            ),
          ],
        ),
      ),
    );
  }
}