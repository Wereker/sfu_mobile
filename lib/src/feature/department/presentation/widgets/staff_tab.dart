import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sfu/src/core/theme/app_theme.dart';
import 'package:sfu/src/feature/department/presentation/bloc/department_bloc.dart';
import 'package:sfu/src/feature/department/presentation/widgets/staff_card.dart';
import 'package:sfu/src/feature/department/presentation/widgets/staff_skeleton.dart';

class StaffTab extends StatelessWidget {
  const StaffTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DepartmentBloc, DepartmentState>(
      builder: (context, state) => state.when(
        initial: () => const StaffSkeleton(),
        loading: () => const StaffSkeleton(),
        success: (staff) => SliverList.separated(
          separatorBuilder: (_, __) => const SizedBox(height: 10),
          itemCount: staff.length,
          itemBuilder: (_, i) => StaffCard(member: staff[i]),
        ),
        error: (msg) => SliverToBoxAdapter(
          child: _StaffError(message: msg),
        ),
      ),
    );
  }
}

class _StaffError extends StatelessWidget {
  const _StaffError({required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt  = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(top: 64),
      child: Center(
        child: Column(
          children: [
            Icon(Icons.wifi_off_outlined, size: 40, color: ext.errorFg),
            const SizedBox(height: 12),
            Text(
              message,
              style: tt.bodyMedium?.copyWith(color: ext.textSecondary),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            TextButton.icon(
              onPressed: () => context
                  .read<DepartmentBloc>()
                  .add(const DepartmentEvent.load()),
              icon: const Icon(Icons.refresh),
              label: const Text('Повторить'),
            ),
          ],
        ),
      ),
    );
  }
}