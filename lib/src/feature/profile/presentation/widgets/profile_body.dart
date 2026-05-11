import 'package:flutter/material.dart';
import 'package:sfu/src/core/theme/app_theme.dart';
import 'package:sfu/src/feature/profile/domain/entity/user.dart';
import 'package:sfu/src/feature/profile/presentation/widgets/app_settings_card.dart';
import 'package:sfu/src/feature/profile/presentation/widgets/bio_card_widget.dart';
import 'package:sfu/src/feature/profile/presentation/widgets/contact_card_widget.dart';
import 'package:sfu/src/feature/profile/presentation/widgets/logout_button.dart';
import 'package:sfu/src/feature/profile/presentation/widgets/notification_card_widget.dart';
import 'package:sfu/src/feature/profile/presentation/widgets/profile_app_bar.dart';
import 'package:sfu/src/feature/profile/presentation/widgets/profile_header_widget.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({super.key, required this.user});
  final User user;

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  late final TextEditingController _phoneCtrl;
  late final TextEditingController _emailCtrl;
  late final TextEditingController _tgCtrl;
  late final TextEditingController _bioCtrl;

  bool _editingPhone = false;
  bool _editingEmail = false;
  bool _editingTg = false;
  bool _editingBio = false;

  bool _notifyChats = true;
  bool _notifyNews = true;
  bool _notifyEvents = false;

  bool get _isTeacher => widget.user.role == 'teacher';

  @override
  void initState() {
    super.initState();
    _phoneCtrl = TextEditingController(text: widget.user.phone ?? '');
    // _emailCtrl = TextEditingController(text: widget.user.email ?? '');
    _emailCtrl = TextEditingController(text: '');
    // _tgCtrl    = TextEditingController(text: widget.user.telegram ?? '');
    _tgCtrl = TextEditingController(text: '');
    _bioCtrl = TextEditingController(text: widget.user.bio ?? '');
  }

  @override
  void dispose() {
    _phoneCtrl.dispose();
    _emailCtrl.dispose();
    _tgCtrl.dispose();
    _bioCtrl.dispose();
    super.dispose();
  }

  String get _fullName =>
      '${widget.user.lastName} ${widget.user.firstName}'
      '${widget.user.fatherName != null ? ' ${widget.user.fatherName}' : ''}';

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt = Theme.of(context).textTheme;

    return CustomScrollView(
      slivers: [
        const ProfileAppBar(),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 40),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              ProfileHeader(user: widget.user, fullName: _fullName),

              const SizedBox(height: 24),

              // «О себе» — только для преподавателя
              if (_isTeacher) ...[
                _SectionLabel(label: 'О себе'),
                const SizedBox(height: 8),
                BioCard(
                  controller: _bioCtrl,
                  isEditing: _editingBio,
                  onToggle: () => setState(() => _editingBio = !_editingBio),
                ),
                const SizedBox(height: 24),
              ],

              _SectionLabel(label: 'Контакты'),
              const SizedBox(height: 8),
              ContactCard(
                phoneCtrl: _phoneCtrl,
                emailCtrl: _emailCtrl,
                tgCtrl: _tgCtrl,
                editingPhone: _editingPhone,
                editingEmail: _editingEmail,
                editingTg: _editingTg,
                onTogglePhone: () =>
                    setState(() => _editingPhone = !_editingPhone),
                onToggleEmail: () =>
                    setState(() => _editingEmail = !_editingEmail),
                onToggleTg: () => setState(() => _editingTg = !_editingTg),
              ),

              const SizedBox(height: 24),

              _SectionLabel(label: 'Настройки'),
              const SizedBox(height: 8),
              const AppSettingsCard(),

              const SizedBox(height: 24),

              _SectionLabel(label: 'Уведомления'),
              const SizedBox(height: 8),
              NotificationsCard(
                notifyChats: _notifyChats,
                notifyNews: _notifyNews,
                notifyEvents: _notifyEvents,
                onChats: (v) => setState(() => _notifyChats = v),
                onNews: (v) => setState(() => _notifyNews = v),
                onEvents: (v) => setState(() => _notifyEvents = v),
              ),

              const SizedBox(height: 32),

              const LogoutButton(),

              const SizedBox(height: 16),

              Center(
                child: Text(
                  'Версия 1.1.0',
                  style: tt.labelSmall?.copyWith(color: ext.textTertiary),
                ),
              ),

              SizedBox(height: MediaQuery.of(context).padding.bottom),
            ]),
          ),
        ),
      ],
    );
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) =>
      Text(label, style: Theme.of(context).textTheme.titleMedium);
}
