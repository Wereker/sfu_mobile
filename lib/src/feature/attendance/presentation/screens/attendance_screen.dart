import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sfu/src/app/dependency_injection/injection.dart';
import 'package:sfu/src/feature/attendance/presentation/bloc/session/attendance_session_bloc.dart';
import 'package:sfu/src/feature/attendance/presentation/widgets/attendance_app_bar.dart';
import 'package:sfu/src/feature/attendance/presentation/widgets/attendance_day_picker.dart';
import 'package:sfu/src/feature/attendance/presentation/widgets/attendance_empty_view.dart';
import 'package:sfu/src/feature/attendance/presentation/widgets/journal_sheet.dart';
import 'package:sfu/src/feature/attendance/presentation/widgets/lesson_attendance_card.dart';
import 'package:sfu/src/feature/timetable/data/data_source/remote/timetable_remote_data_source.dart';
import 'package:sfu/src/feature/timetable/domain/entity/lesson/lesson.dart';
import 'package:sfu/src/feature/timetable/presentation/bloc/timetable_bloc.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  int _selectedDay = DateTime.now().weekday.clamp(1, 6);

  static const int _teacherId = 30;

  int get _currentWeek {
    final now = DateTime.now();
    final academicStart = _academicYearStart(now);
    final weeks = now.difference(academicStart).inDays ~/ 7;
    return (weeks % 2 == 0) ? 1 : 2;
  }

  DateTime _academicYearStart(DateTime date) {
    final sep = DateTime(date.year, 9, 1);
    return date.isBefore(sep) ? DateTime(date.year - 1, 9, 1) : sep;
  }

  @override
  void initState() {
    super.initState();
    // Загружаем расписание преподавателя сразу при открытии экрана
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.read<TimetableBloc>().add(
          TimetableEvent.loadData(
            userId: _teacherId,
            userType: TimetableTargetType.teacher,
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<AttendanceSessionBloc>(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: BlocBuilder<TimetableBloc, TimetableState>(
              builder: (context, timetableState) {
                final timetable = timetableState.maybeWhen(
                  success: (t, _) => t,
                  orElse: () => null,
                );

                final week = _currentWeek;
                final lessonList = timetable != null
                    ? (week == 1 ? timetable.week1 : timetable.week2)
                    .lessons
                    .where((l) => l.day == _selectedDay)
                    .toList()
                    : <Lesson>[];

                lessonList.sort(
                        (a, b) => a.timeStart.compareTo(b.timeStart));

                return RefreshIndicator(
                  onRefresh: () async {
                    context.read<TimetableBloc>().add(
                      TimetableEvent.loadData(
                        userId: _teacherId,
                        userType: TimetableTargetType.teacher,
                      ),
                    );
                    await Future.delayed(const Duration(seconds: 1));
                  },
                  child: CustomScrollView(
                    slivers: [
                      const AttendanceAppBar(),

                      SliverToBoxAdapter(
                        child: Padding(
                          padding:
                          const EdgeInsets.fromLTRB(16, 12, 16, 0),
                          child: AttendanceDayPicker(
                            selected: _selectedDay,
                            onChanged: (d) =>
                                setState(() => _selectedDay = d),
                          ),
                        ),
                      ),

                      if (timetableState.maybeWhen(
                        loading: () => true,
                        initial: () => true,
                        orElse: () => false,
                      ))
                        const SliverToBoxAdapter(
                          child: Padding(
                            padding: EdgeInsets.only(top: 64),
                            child: Center(
                                child: CircularProgressIndicator()),
                          ),
                        )
                      else if (lessonList.isEmpty)
                        const SliverToBoxAdapter(
                            child: AttendanceEmptyView())
                      else
                        SliverPadding(
                          padding: const EdgeInsets.fromLTRB(
                              16, 16, 16, 32),
                          sliver: SliverList.separated(
                            separatorBuilder: (_, __) =>
                            const SizedBox(height: 10),
                            itemCount: lessonList.length,
                            itemBuilder: (ctx, i) {
                              final lesson = lessonList[i];
                              return LessonAttendanceCard(
                                lesson: _toLessonData(lesson),
                                onTap: () => _openJournal(ctx, lesson),
                              );
                            },
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  void _openJournal(BuildContext context, Lesson lesson) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.transparent,
      builder: (_) => BlocProvider.value(
        value: context.read<AttendanceSessionBloc>(),
        child: JournalSheet(
          lessonId: lesson.id,
          lessonTitle: lesson.subject,
          lessonGroup: lesson.teacherName.isNotEmpty
              ? lesson.teacherName
              : 'Группа ${lesson.groupId}',
          lessonTime: '${lesson.timeStart}–${lesson.timeEnd}',
          lessonPlace: lesson.isOnline
              ? 'ЭИОС'
              : lesson.room.isNotEmpty
              ? 'ауд. ${lesson.room}'
              : '',
        ),
      ),
    );
  }

  LessonData _toLessonData(Lesson lesson) => LessonData(
    id: lesson.id,
    subject: lesson.subject,
    type: lesson.type == LessonType.lecture
        ? 'лекция'
        : lesson.type == LessonType.practice
        ? 'пр. занятие'
        : 'лаб. работа',
    time: '${lesson.timeStart}–${lesson.timeEnd}',
    place: lesson.isOnline
        ? 'ЭИОС'
        : lesson.room.isNotEmpty
        ? 'ауд. ${lesson.room}'
        : '',
    group: lesson.teacherName.isNotEmpty
        ? lesson.teacherName
        : 'Группа ${lesson.groupId}',
    studentCount: 5,
    isStarted: false,
    presentCount: 0,
  );
}

class LessonData {
  final int id;
  final String subject;
  final String type;
  final String time;
  final String place;
  final String group;
  final int studentCount;
  bool isStarted;
  int presentCount;

  LessonData({
    required this.id,
    required this.subject,
    required this.type,
    required this.time,
    required this.place,
    required this.group,
    required this.studentCount,
    required this.isStarted,
    required this.presentCount,
  });

  double get attendanceRate =>
      studentCount == 0 ? 0.0 : presentCount / studentCount;
}