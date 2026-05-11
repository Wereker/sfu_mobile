import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sfu/src/app/dependency_injection/injection.dart';
import 'package:sfu/src/feature/attendance/presentation/bloc/session/attendance_session_bloc.dart';
import 'package:sfu/src/feature/attendance/presentation/widgets/attendance_app_bar.dart';
import 'package:sfu/src/feature/attendance/presentation/widgets/attendance_day_picker.dart';
import 'package:sfu/src/feature/attendance/presentation/widgets/attendance_empty_view.dart';
import 'package:sfu/src/feature/attendance/presentation/widgets/attendance_skeleton.dart';
import 'package:sfu/src/feature/attendance/presentation/widgets/journal_sheet.dart';
import 'package:sfu/src/feature/attendance/presentation/widgets/lesson_attendance_card.dart';
import 'package:sfu/src/feature/timetable/domain/entity/lesson/lesson.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  int _selectedDay = DateTime.now().weekday.clamp(1, 6);

  // Синтетические пары — заменятся на TimetableBloc когда появится интеграция
  // Здесь используем Lesson из domain/timetable как источник данных о парах
  static final _sampleLessons = <LessonData>[
    LessonData(
      id: 'lesson_1',
      subject: 'Машинное обучение',
      type: 'лекция',
      time: '10:15–11:50',
      place: 'Л4-21',
      group: 'БИ22-01',
      studentCount: 12,
      isStarted: true,
      presentCount: 9,
    ),
    LessonData(
      id: 'lesson_2',
      subject: 'Глубокое обучение',
      type: 'пр. занятие',
      time: '12:00–13:35',
      place: 'Л4-12',
      group: 'БИ22-02',
      studentCount: 10,
      isStarted: false,
      presentCount: 0,
    ),
    LessonData(
      id: 'lesson_3',
      subject: 'Компьютерное зрение',
      type: 'лаб. работа',
      time: '14:10–15:45',
      place: 'УЛК 2-15',
      group: 'БИ22-01',
      studentCount: 6,
      isStarted: false,
      presentCount: 0,
    ),
  ];

  void _openJournal(BuildContext context, LessonData lesson) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.transparent,
      builder: (_) => BlocProvider.value(
        value: context.read<AttendanceSessionBloc>(),
        child: JournalSheet(
          lessonId:    lesson.id,
          lessonTitle: lesson.subject,
          lessonGroup: lesson.group,
          lessonTime:  lesson.time,
          lessonPlace: lesson.place,
          isStarted:   lesson.isStarted,
          onStarted: () => setState(() => lesson.isStarted = true),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<AttendanceSessionBloc>(),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            const AttendanceAppBar(),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                child: AttendanceDayPicker(
                  selected: _selectedDay,
                  onChanged: (d) => setState(() => _selectedDay = d),
                ),
              ),
            ),

            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
              sliver: _sampleLessons.isEmpty
                  ? const SliverToBoxAdapter(child: AttendanceEmptyView())
                  : SliverList.separated(
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemCount: _sampleLessons.length,
                itemBuilder: (ctx, i) => LessonAttendanceCard(
                  lesson: _sampleLessons[i],
                  onTap: () => _openJournal(ctx, _sampleLessons[i]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Легковесная модель данных пары для UI (до интеграции с TimetableBloc)
class LessonData {
  final String id;
  final String subject;
  final String type;
  final String time;
  final String place;
  final String group;
  final int    studentCount;
  bool         isStarted;
  int          presentCount;

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
      studentCount == 0 ? 0 : presentCount / studentCount;
}