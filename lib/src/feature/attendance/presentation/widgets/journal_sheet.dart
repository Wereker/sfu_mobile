import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:sfu/src/core/theme/app_theme.dart';
import 'package:sfu/src/core/l10n/strings.g.dart';
import 'package:sfu/src/feature/attendance/domain/entity/attendance_student.dart';
import 'package:sfu/src/feature/attendance/presentation/bloc/session/attendance_session_bloc.dart';
import 'package:sfu/src/feature/attendance/presentation/widgets/journal_student_row.dart';
import 'package:sfu/src/feature/attendance/presentation/widgets/shared/attendance_filter_chip.dart';

class JournalSheet extends StatefulWidget {
  const JournalSheet({
    super.key,
    required this.lessonId,
    required this.lessonTitle,
    required this.lessonGroup,
    required this.lessonTime,
    required this.lessonPlace,
  });

  final int    lessonId;
  final String lessonTitle;
  final String lessonGroup;
  final String lessonTime;
  final String lessonPlace;

  @override
  State<JournalSheet> createState() => _JournalSheetState();
}

class _JournalSheetState extends State<JournalSheet> {
  String _filter = 'all';

  @override
  void initState() {
    super.initState();
    // При открытии журнала сразу загружаем кто уже отметился
    context.read<AttendanceSessionBloc>()
        .add(AttendanceSessionEvent.loadStudents(widget.lessonId));
  }

  void _startSession() {
    context.read<AttendanceSessionBloc>()
        .add(AttendanceSessionEvent.createSession(widget.lessonId));
  }

  void _markManual(String studentId) {
    context.read<AttendanceSessionBloc>().add(
      AttendanceSessionEvent.markManual(
        lessonId: widget.lessonId,
        studentId: int.tryParse(studentId) ?? 0,
      ),
    );
  }

  void _refresh() {
    context.read<AttendanceSessionBloc>()
        .add(AttendanceSessionEvent.refresh(widget.lessonId));
  }

  List<AttendanceStudent> _applyFilter(List<AttendanceStudent> students) {
    return switch (_filter) {
      'present' => students
          .where((s) =>
      s.status == AttendanceStatus.present ||
          s.status == AttendanceStatus.late)
          .toList(),
      'absent' => students
          .where((s) =>
      s.status == AttendanceStatus.absent ||
          s.status == AttendanceStatus.excused)
          .toList(),
      _ => students,
    };
  }

  @override
  Widget build(BuildContext context) {
    final ext     = Theme.of(context).extension<AppColors>()!;
    final tt      = Theme.of(context).textTheme;
    final cs      = Theme.of(context).colorScheme;
    final screenH = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
            child: Container(color: Colors.black.withValues(alpha: .35)),
          ),
        ),

        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: screenH * 0.82,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(AppTheme.radiusLg)),
            ),
            child: BlocBuilder<AttendanceSessionBloc, AttendanceSessionState>(
              builder: (context, state) {
                final session = state.maybeWhen(
                  sessionReady: (s) => s,
                  studentsSuccess: (s, _) => s,
                  orElse: () => null,
                );
                final students = state.maybeWhen(
                  studentsSuccess: (_, s) => s,
                  orElse: () => <AttendanceStudent>[],
                );
                final isSessionLoading = state.maybeWhen(
                  sessionLoading: () => true,
                  orElse: () => false,
                );
                final isStudentsLoading = state.maybeWhen(
                  studentsLoading: () => true,
                  orElse: () => false,
                );
                final hasSession = session != null;
                final presentCount = students
                    .where((s) =>
                s.status == AttendanceStatus.present ||
                    s.status == AttendanceStatus.late)
                    .length;

                return Column(
                  children: [
                    // Ручка
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 4),
                      child: Container(
                        width: 36, height: 4,
                        decoration: BoxDecoration(
                            color: ext.border,
                            borderRadius: BorderRadius.circular(2)),
                      ),
                    ),

                    // Заголовок
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(widget.lessonTitle,
                                        style: tt.titleMedium),
                                    const SizedBox(height: 2),
                                    Text(
                                      '${widget.lessonGroup} · '
                                          '${widget.lessonTime} · '
                                          '${widget.lessonPlace}',
                                      style: tt.labelSmall?.copyWith(
                                          color: ext.textSecondary),
                                    ),
                                  ],
                                ),
                              ),

                              // QR-кнопка — показывает токен из API
                              if (hasSession && session.isActive)
                                GestureDetector(
                                  onTap: () => _showQrModal(
                                      context, session.token),
                                  child: Container(
                                    width: 40, height: 40,
                                    decoration: BoxDecoration(
                                      color: cs.primary.withValues(alpha: .1),
                                      borderRadius: BorderRadius.circular(
                                          AppTheme.radiusMd),
                                    ),
                                    child: Icon(Icons.qr_code_2,
                                        color: cs.primary, size: 22),
                                  ),
                                ),

                              // Кнопка обновления
                              const SizedBox(width: 8),
                              GestureDetector(
                                onTap: _refresh,
                                child: Container(
                                  width: 40, height: 40,
                                  decoration: BoxDecoration(
                                    color: ext.surfaceTinted,
                                    borderRadius: BorderRadius.circular(
                                        AppTheme.radiusMd),
                                  ),
                                  child: Icon(Icons.refresh,
                                      color: ext.textSecondary, size: 20),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 12),

                          // Статистика
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 6),
                                decoration: BoxDecoration(
                                  color: ext.successBg,
                                  borderRadius: BorderRadius.circular(
                                      AppTheme.radiusSm),
                                ),
                                child: Text(
                                  '$presentCount / ${students.length}',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: ext.successFg,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 10),

                          // Фильтры
                          Row(
                            children: [
                              AttendanceFilterChip(
                                label: t.attendance.filterAll,
                                isActive: _filter == 'all',
                                onTap: () =>
                                    setState(() => _filter = 'all'),
                              ),
                              const SizedBox(width: 6),
                              AttendanceFilterChip(
                                label: t.attendance.filterPresent,
                                isActive: _filter == 'present',
                                onTap: () =>
                                    setState(() => _filter = 'present'),
                              ),
                              const SizedBox(width: 6),
                              AttendanceFilterChip(
                                label: t.attendance.filterAbsent,
                                isActive: _filter == 'absent',
                                onTap: () =>
                                    setState(() => _filter = 'absent'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    Divider(height: 16, color: ext.divider),

                    // Кнопка «Создать QR» — если сессии нет
                    if (!hasSession)
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                        child: SizedBox(
                          width: double.infinity,
                          height: 44,
                          child: ElevatedButton.icon(
                            onPressed: isSessionLoading ? null : _startSession,
                            icon: isSessionLoading
                                ? const SizedBox(
                              width: 16, height: 16,
                              child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white),
                            )
                                : const Icon(Icons.qr_code_2, size: 18),
                            label: Text(t.attendance.createQr),
                          ),
                        ),
                      ),

                    // Список студентов
                    Expanded(
                      child: isStudentsLoading
                          ? const Center(child: CircularProgressIndicator())
                          : students.isEmpty
                          ? Center(
                        child: Text(
                          t.attendance.listLoading,
                          style: tt.bodyMedium?.copyWith(
                              color: ext.textSecondary),
                        ),
                      )
                          : RefreshIndicator(
                        onRefresh: () async => _refresh(),
                        child: ListView.separated(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16),
                          separatorBuilder: (_, __) =>
                              Divider(height: 1, color: ext.divider),
                          itemCount: _applyFilter(students).length,
                          itemBuilder: (_, i) {
                            final student =
                            _applyFilter(students)[i];
                            return JournalStudentRow(
                              student: student,
                              onMarkManual: () =>
                                  _markManual(student.id),
                              onStatusChanged: (_) =>
                                  _markManual(student.id),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  void _showQrModal(BuildContext context, String token) {
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt  = Theme.of(context).textTheme;
    final cs  = Theme.of(context).colorScheme;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: cs.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppTheme.radiusLg)),
      ),
      builder: (_) => Padding(
        padding: const EdgeInsets.fromLTRB(24, 16, 24, 48),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Container(
                width: 36, height: 4,
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                    color: ext.border,
                    borderRadius: BorderRadius.circular(2)),
              ),
            ),
            Text('QR для отметки', style: tt.titleMedium),
            const SizedBox(height: 6),
            Text(
              t.attendance.studentsScanning,
              style: tt.bodySmall?.copyWith(color: ext.textSecondary),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(AppTheme.radiusMd),
              ),
              child: QrImageView(
                data: token,
                size: 220,
                backgroundColor: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              t.attendance.tokenValid,
              style: tt.labelSmall?.copyWith(color: ext.textTertiary),
            ),
          ],
        ),
      ),
    );
  }
}