import 'package:flutter/material.dart';
import 'package:sfu/src/core/theme/app_theme.dart';

class AttendanceDayPicker extends StatelessWidget {
  const AttendanceDayPicker({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  final int selected;
  final ValueChanged<int> onChanged;

  static const _labels = ['Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб'];

  DateTime _dateForWeekday(int wd) {
    final today  = DateTime.now();
    final monday = today.subtract(Duration(days: today.weekday - 1));
    return monday.add(Duration(days: wd - 1));
  }

  @override
  Widget build(BuildContext context) {
    final cs  = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColors>()!;
    final now = DateTime.now();

    return Row(
      children: List.generate(6, (i) {
        final wd      = i + 1;
        final date    = _dateForWeekday(wd);
        final isActive = wd == selected;
        final isToday  = wd == now.weekday;

        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: i < 5 ? 6 : 0),
            child: GestureDetector(
              onTap: () => onChanged(wd),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: isActive ? cs.primary : cs.surface,
                  borderRadius: BorderRadius.circular(AppTheme.radiusMd),
                  border: Border.all(
                    color: isActive
                        ? cs.primary
                        : isToday
                        ? cs.primary.withValues(alpha: .4)
                        : ext.border,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _labels[i],
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: isActive ? cs.onPrimary : ext.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      '${date.day}',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: isActive ? cs.onPrimary : ext.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}