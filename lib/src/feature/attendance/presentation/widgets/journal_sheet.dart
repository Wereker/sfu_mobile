import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sfu/src/core/theme/app_theme.dart';
import 'package:sfu/src/feature/attendance/domain/entity/attendance_student.dart';
import 'package:sfu/src/feature/attendance/presentation/bloc/session/attendance_session_bloc.dart';
import 'package:sfu/src/feature/attendance/presentation/widgets/journal_qr_modal.dart';
import 'package:sfu/src/feature/attendance/presentation/widgets/journal_student_row.dart';
import 'package:sfu/src/feature/attendance/presentation/widgets/shared/attendance_filter_chip.dart';
import 'package:sfu/src/feature/attendance/presentation/widgets/shared/attendance_small_button.dart';

class JournalSheet extends StatefulWidget {
  const JournalSheet({
    super.key,
    required this.lessonId,
    required this.lessonTitle,
    required this.lessonGroup,
    required this.lessonTime,
    required this.lessonPlace,
    required this.isStarted,
    required this.onStarted,
  });

  final String lessonId;
  final String lessonTitle;
  final String lessonGroup;
  final String lessonTime;
  final String lessonPlace;
  final bool isStarted;
  final VoidCallback onStarted;

  @override
  State<JournalSheet> createState() => _JournalSheetState();
}

class _JournalSheetState extends State<JournalSheet> {
  String _filter    = 'all';
  bool   _isStarted = false;
  String? _sessionId;

  @override
  void initState() {
    super.initState();
    _isStarted = widget.isStarted;
    if (_isStarted) {
      // Загружаем студентов если пара уже начата
      _loadStudents();
    }
  }

  void _loadStudents() {
    if (_sessionId != null) {
      context.read<AttendanceSessionBloc>()
          .add(AttendanceSessionEvent.loadStudents(_sessionId!));
    }
  }

  void _startLesson() {
    context.read<AttendanceSessionBloc>().add(
      AttendanceSessionEvent.createSession(widget.lessonId),
    );
  }

  void _openQr(BuildContext context) {
    if (_sessionId == null) return;
    final token =
        'sfu_attend_${widget.lessonId}_${DateTime.now().millisecondsSinceEpoch}';
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.transparent,
      builder: (_) => JournalQrModal(
        token:      token,
        lessonTitle: widget.lessonTitle,
        group:       widget.lessonGroup,
      ),
    );
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

    return BlocListener<AttendanceSessionBloc, AttendanceSessionState>(
      listener: (context, state) {
        state.maybeWhen(
          sessionReady: (session) {
            setState(() {
              _sessionId = session.sessionId;
              _isStarted = true;
            });
            widget.onStarted();
            // Сразу загружаем студентов
            context.read<AttendanceSessionBloc>()
                .add(AttendanceSessionEvent.loadStudents(session.sessionId));
          },
          orElse: () {},
        );
      },
      child: Stack(
        children: [
          // Блюр
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
              child:
              Container(color: Colors.black.withValues(alpha: .35)),
            ),
          ),

          // Шторка
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: screenH * 0.78,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(AppTheme.radiusLg)),
              ),
              child: Column(
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
                            // QR-кнопка — только если пара начата
                            if (_isStarted)
                              GestureDetector(
                                onTap: () => _openQr(context),
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
                          ],
                        ),

                        const SizedBox(height: 12),

                        // Статистика + быстрые действия
                        BlocBuilder<AttendanceSessionBloc,
                            AttendanceSessionState>(
                          builder: (context, state) {
                            final students = state.maybeWhen(
                              studentsSuccess: (s) => s,
                              orElse: () => <AttendanceStudent>[],
                            );
                            final presentCount = students
                                .where((s) =>
                            s.status == AttendanceStatus.present ||
                                s.status == AttendanceStatus.late)
                                .length;

                            return Row(
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
                                const SizedBox(width: 8),
                                AttendanceSmallButton(
                                  label: 'Все здесь',
                                  icon: Icons.done_all,
                                  onTap: () {
                                    for (final s in students) {
                                      context
                                          .read<AttendanceSessionBloc>()
                                          .add(AttendanceSessionEvent.updateStatus(
                                        _sessionId!,
                                        s.id,
                                        AttendanceStatus.present,
                                      ));
                                    }
                                  },
                                ),
                                const SizedBox(width: 6),
                                AttendanceSmallButton(
                                  label: 'Сбросить',
                                  icon: Icons.restart_alt,
                                  onTap: () {
                                    for (final s in students) {
                                      context
                                          .read<AttendanceSessionBloc>()
                                          .add(AttendanceSessionEvent.updateStatus(
                                        _sessionId!,
                                        s.id,
                                        AttendanceStatus.absent,
                                      ));
                                    }
                                  },
                                ),
                              ],
                            );
                          },
                        ),

                        const SizedBox(height: 10),

                        // Фильтры
                        Row(
                          children: [
                            AttendanceFilterChip(
                              label: 'Все',
                              isActive: _filter == 'all',
                              onTap: () => setState(() => _filter = 'all'),
                            ),
                            const SizedBox(width: 6),
                            AttendanceFilterChip(
                              label: 'Присутствуют',
                              isActive: _filter == 'present',
                              onTap: () =>
                                  setState(() => _filter = 'present'),
                            ),
                            const SizedBox(width: 6),
                            AttendanceFilterChip(
                              label: 'Отсутствуют',
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

                  // Кнопка «Начать занятие»
                  if (!_isStarted)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                      child: SizedBox(
                        width: double.infinity,
                        height: 44,
                        child: BlocBuilder<AttendanceSessionBloc,
                            AttendanceSessionState>(
                          builder: (context, state) {
                            final isLoading = state.maybeWhen(
                              sessionLoading: () => true,
                              orElse: () => false,
                            );
                            return ElevatedButton.icon(
                              onPressed: isLoading ? null : _startLesson,
                              icon: isLoading
                                  ? const SizedBox(
                                width: 16, height: 16,
                                child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white),
                              )
                                  : const Icon(
                                  Icons.play_arrow_rounded, size: 18),
                              label: const Text('Начать занятие'),
                            );
                          },
                        ),
                      ),
                    ),

                  // Список студентов
                  Expanded(
                    child: BlocBuilder<AttendanceSessionBloc,
                        AttendanceSessionState>(
                      builder: (context, state) {
                        return state.when(
                          initial: () => _EmptyStudents(ext: ext, tt: tt),
                          sessionLoading: () =>
                          const Center(child: CircularProgressIndicator()),
                          sessionReady: (_) =>
                              _EmptyStudents(ext: ext, tt: tt),
                          studentsLoading: () =>
                          const Center(child: CircularProgressIndicator()),
                          studentsSuccess: (students) {
                            final filtered = _applyFilter(students);
                            return ListView.separated(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              separatorBuilder: (_, __) =>
                                  Divider(height: 1, color: ext.divider),
                              itemCount: filtered.length,
                              itemBuilder: (_, i) => JournalStudentRow(
                                student: filtered[i],
                                onStatusChanged: (AttendanceStatus status) {
                                  context.read<AttendanceSessionBloc>().add(
                                    AttendanceSessionEvent.updateStatus(
                                      _sessionId!,
                                      filtered[i].id,
                                      status,
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                          error: (msg) => Center(
                            child: Text(msg,
                                style: tt.bodyMedium
                                    ?.copyWith(color: ext.textSecondary)),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _EmptyStudents extends StatelessWidget {
  const _EmptyStudents({required this.ext, required this.tt});
  final AppColors ext;
  final TextTheme tt;

  @override
  Widget build(BuildContext context) => Center(
    child: Text('Начните занятие чтобы увидеть список',
        style: tt.bodyMedium?.copyWith(color: ext.textSecondary)),
  );
}