import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sfu/src/app/dependency_injection/injection.dart' as di;
import 'package:sfu/src/core/auth/presentation/bloc/auth_bloc.dart';
import 'package:sfu/src/core/theme/app_theme.dart';
import 'package:sfu/src/core/widgets/loading_indicator_widget.dart';
import 'package:sfu/src/feature/profile/domain/entity/user.dart';
import 'package:sfu/src/feature/profile/presentation/bloc/profile_bloc.dart';
import 'package:sfu/src/feature/settings/presentation/bloc/settings_bloc.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              di.sl<ProfileBloc>()..add(ProfileEvent.loadData()),
        ),
        BlocProvider(
          create: (_) =>
              di.sl<SettingsBloc>()..add(SettingsEvent.getAppSettings()),
        ),
      ],
      child: const Scaffold(body: _ProfileContent()),
    );
  }
}

class _ProfileContent extends StatelessWidget {
  const _ProfileContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) => state.maybeWhen(
        loading: () => const _LoadingView(),
        success: (user) => _ProfileBody(user: user),
        error: (_) => const _ErrorView(),
        orElse: () => const _LoadingView(),
      ),
    );
  }
}

class _LoadingView extends StatelessWidget {
  const _LoadingView();
  @override
  Widget build(BuildContext context) => CustomScrollView(slivers: [
        const _ProfileAppBar(),
        const SliverFillRemaining(
          child: Center(child: LoadingIndicatorWidget()),
        ),
      ]);
}

class _ErrorView extends StatelessWidget {
  const _ErrorView();
  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt = Theme.of(context).textTheme;
    return CustomScrollView(slivers: [
      const _ProfileAppBar(),
      SliverFillRemaining(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 64, height: 64,
                decoration: BoxDecoration(color: ext.errorBg, shape: BoxShape.circle),
                child: Icon(Icons.wifi_off_outlined, size: 28, color: ext.errorFg),
              ),
              const SizedBox(height: 16),
              Text('Не удалось загрузить профиль',
                  style: tt.titleMedium, textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    ]);
  }
}

class _ProfileAppBar extends StatelessWidget {
  const _ProfileAppBar();

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt = Theme.of(context).textTheme;

    return SliverAppBar(
      pinned: true,
      floating: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      toolbarHeight: 72,
      flexibleSpace: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 48),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Профиль', style: tt.displaySmall),
                      const SizedBox(height: 2),
                      Text('Личный кабинет',
                          style: tt.labelLarge?.copyWith(color: ext.textSecondary)),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                width: 48, height: 48,
                decoration: BoxDecoration(
                  color: cs.primary,
                  borderRadius: BorderRadius.circular(AppTheme.radiusMd),
                ),
                padding: const EdgeInsets.all(6),
                child: SvgPicture.asset('assets/images/logo_app_bar.svg'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileBody extends StatefulWidget {
  const _ProfileBody({required this.user});
  final User user;

  @override
  State<_ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<_ProfileBody> {
  late final TextEditingController _phoneCtrl;
  late final TextEditingController _emailCtrl;
  late final TextEditingController _tgCtrl;

  bool _editingPhone = false;
  bool _editingEmail = false;
  bool _editingTg    = false;

  bool _notifyChats    = true;
  bool _notifyNews     = true;
  bool _notifyEvents   = false;

  @override
  void initState() {
    super.initState();
    _phoneCtrl = TextEditingController(text: widget.user.phone);
    _emailCtrl = TextEditingController(text: '');   // нет в модели — заглушка
    _tgCtrl    = TextEditingController(text: '');   // нет в модели — заглушка
  }

  @override
  void dispose() {
    _phoneCtrl.dispose();
    _emailCtrl.dispose();
    _tgCtrl.dispose();
    super.dispose();
  }

  String get _fullName =>
      '${widget.user.lastName} ${widget.user.firstName}'
      '${widget.user.fatherName != null ? ' ${widget.user.fatherName}' : ''}';

  String get _roleLabel =>
      widget.user.role == 'teacher' ? 'Преподаватель' : 'Студент';

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt = Theme.of(context).textTheme;

    return CustomScrollView(
      slivers: [
        const _ProfileAppBar(),

        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 40),
          sliver: SliverList(
            delegate: SliverChildListDelegate([

              _ProfileHeader(
                fullName: _fullName,
                roleLabel: _roleLabel,
                group: widget.user.group,
                subgroup: widget.user.subgroup,
                sex: widget.user.sex,
                recordBook: widget.user.recordBookNumber,
                cs: cs,
                ext: ext,
                tt: tt,
              ),

              const SizedBox(height: 24),

              _SectionLabel(label: 'Контакты', ext: ext, tt: tt),
              const SizedBox(height: 8),
              _ContactCard(
                phoneCtrl: _phoneCtrl,
                emailCtrl: _emailCtrl,
                tgCtrl: _tgCtrl,
                editingPhone: _editingPhone,
                editingEmail: _editingEmail,
                editingTg: _editingTg,
                onTogglePhone: () => setState(() => _editingPhone = !_editingPhone),
                onToggleEmail: () => setState(() => _editingEmail = !_editingEmail),
                onToggleTg:    () => setState(() => _editingTg    = !_editingTg),
                cs: cs,
                ext: ext,
                tt: tt,
              ),

              const SizedBox(height: 24),

              _SectionLabel(label: 'Настройки', ext: ext, tt: tt),
              const SizedBox(height: 8),
              _AppSettingsCard(cs: cs, ext: ext, tt: tt),

              const SizedBox(height: 24),

              _SectionLabel(label: 'Уведомления', ext: ext, tt: tt),
              const SizedBox(height: 8),
              _NotificationsCard(
                notifyChats: _notifyChats,
                notifyNews: _notifyNews,
                notifyEvents: _notifyEvents,
                onChats:  (v) => setState(() => _notifyChats  = v),
                onNews:   (v) => setState(() => _notifyNews   = v),
                onEvents: (v) => setState(() => _notifyEvents = v),
                cs: cs,
                ext: ext,
                tt: tt,
              ),

              const SizedBox(height: 32),

              _LogoutButton(cs: cs, ext: ext, tt: tt),

              const SizedBox(height: 16),

              Center(
                child: Text(
                  'Версия 1.0.0',
                  style: tt.labelSmall?.copyWith(color: ext.textTertiary),
                ),
              ),

              SizedBox(height: MediaQuery.of(context).padding.bottom + 16),
            ]),
          ),
        ),
      ],
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader({
    required this.fullName,
    required this.roleLabel,
    required this.group,
    required this.subgroup,
    required this.sex,
    required this.recordBook,
    required this.cs,
    required this.ext,
    required this.tt,
  });

  final String fullName, roleLabel, group, subgroup, recordBook;
  final String? sex;
  final ColorScheme cs;
  final AppColors ext;
  final TextTheme tt;

  static const _hues = [
    Color(0xFFFF9900), Color(0xFFFFB84D), Color(0xFFE68A00),
    Color(0xFFCC7A00), Color(0xFFFFA726), Color(0xFFFB8C00),
  ];

  Color _avatarColor(String name) {
    int h = 0;
    for (final c in name.codeUnits) { h = (h * 31 + c) & 0x7FFFFFFF; }
    return _hues[h % _hues.length];
  }

  String _initials(String name) => name
      .split(' ')
      .where((p) => p.isNotEmpty)
      .take(2)
      .map((p) => p[0])
      .join()
      .toUpperCase();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: cs.surface,
        borderRadius: BorderRadius.circular(AppTheme.radiusLg),
        border: Border.all(color: ext.border),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Аватар
          Container(
            width: 64, height: 64,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _avatarColor(fullName),
            ),
            alignment: Alignment.center,
            child: Text(
              _initials(fullName),
              style: const TextStyle(
                fontSize: 22, fontWeight: FontWeight.w700,
                color: Colors.white, height: 1,
              ),
            ),
          ),
          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(fullName, style: tt.titleMedium),
                const SizedBox(height: 4),

                // Роль
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
                  decoration: BoxDecoration(
                    color: ext.infoBg,
                    borderRadius: BorderRadius.circular(AppTheme.radiusSm),
                  ),
                  child: Text(
                    roleLabel,
                    style: TextStyle(
                      fontSize: 11, fontWeight: FontWeight.w600,
                      color: ext.infoFg, height: 1,
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                // Метаданные
                _MetaLine(icon: Icons.groups_outlined,
                    label: '$group · $subgroup подгруппа', ext: ext, tt: tt),
                if (sex != null && sex!.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  _MetaLine(icon: Icons.person_outline,
                      label: sex!, ext: ext, tt: tt),
                ],
                const SizedBox(height: 4),
                _MetaLine(icon: Icons.badge_outlined,
                    label: 'Зачётная книжка №$recordBook', ext: ext, tt: tt),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactCard extends StatelessWidget {
  const _ContactCard({
    required this.phoneCtrl,
    required this.emailCtrl,
    required this.tgCtrl,
    required this.editingPhone,
    required this.editingEmail,
    required this.editingTg,
    required this.onTogglePhone,
    required this.onToggleEmail,
    required this.onToggleTg,
    required this.cs,
    required this.ext,
    required this.tt,
  });

  final TextEditingController phoneCtrl, emailCtrl, tgCtrl;
  final bool editingPhone, editingEmail, editingTg;
  final VoidCallback onTogglePhone, onToggleEmail, onToggleTg;
  final ColorScheme cs;
  final AppColors ext;
  final TextTheme tt;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: cs.surface,
        borderRadius: BorderRadius.circular(AppTheme.radiusLg),
        border: Border.all(color: ext.border),
      ),
      child: Column(
        children: [
          _EditableContactRow(
            icon: Icons.phone_outlined,
            label: 'Телефон',
            hint: '+7 900 000 00 00',
            controller: phoneCtrl,
            isEditing: editingPhone,
            onToggle: onTogglePhone,
            isLast: false,
            cs: cs, ext: ext, tt: tt,
          ),
          Divider(height: 1, color: ext.divider, indent: 16),
          _EditableContactRow(
            icon: Icons.mail_outline,
            label: 'Почта',
            hint: 'example@sfu-kras.ru',
            controller: emailCtrl,
            isEditing: editingEmail,
            onToggle: onToggleEmail,
            isLast: false,
            cs: cs, ext: ext, tt: tt,
          ),
          Divider(height: 1, color: ext.divider, indent: 16),
          _EditableContactRow(
            icon: Icons.telegram,
            label: 'Telegram',
            hint: '@username',
            controller: tgCtrl,
            isEditing: editingTg,
            onToggle: onToggleTg,
            isLast: true,
            cs: cs, ext: ext, tt: tt,
          ),
        ],
      ),
    );
  }
}

class _EditableContactRow extends StatelessWidget {
  const _EditableContactRow({
    required this.icon,
    required this.label,
    required this.hint,
    required this.controller,
    required this.isEditing,
    required this.onToggle,
    required this.isLast,
    required this.cs,
    required this.ext,
    required this.tt,
  });

  final IconData icon;
  final String label, hint;
  final TextEditingController controller;
  final bool isEditing, isLast;
  final VoidCallback onToggle;
  final ColorScheme cs;
  final AppColors ext;
  final TextTheme tt;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      child: Row(
        children: [
          Icon(icon, size: 18, color: ext.textTertiary),
          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label,
                    style: tt.labelSmall?.copyWith(color: ext.textSecondary)),
                const SizedBox(height: 3),
                isEditing
                    ? TextField(
                        controller: controller,
                        autofocus: true,
                        style: tt.bodyLarge?.copyWith(fontSize: 15),
                        decoration: InputDecoration(
                          hintText: hint,
                          hintStyle: tt.bodyMedium
                              ?.copyWith(color: ext.textTertiary),
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      )
                    : Text(
                        controller.text.isEmpty ? hint : controller.text,
                        style: tt.bodyLarge?.copyWith(
                          fontSize: 15,
                          color: controller.text.isEmpty
                              ? ext.textTertiary
                              : ext.textPrimary,
                        ),
                      ),
              ],
            ),
          ),

          const SizedBox(width: 8),

          // Кнопка редактирования / сохранения
          GestureDetector(
            onTap: onToggle,
            child: Container(
              width: 32, height: 32,
              decoration: BoxDecoration(
                color: isEditing ? cs.primary : ext.surfaceTinted,
                shape: BoxShape.circle,
              ),
              child: Icon(
                isEditing ? Icons.check : Icons.edit_outlined,
                size: 15,
                color: isEditing ? cs.onPrimary : ext.textOnTinted,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AppSettingsCard extends StatelessWidget {
  const _AppSettingsCard({required this.cs, required this.ext, required this.tt});
  final ColorScheme cs;
  final AppColors ext;
  final TextTheme tt;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        final settings = state.maybeWhen(
          success: (s) => s,
          orElse: () => null,
        );

        final isDark = settings?.themeMode == 'dark';
        final isRu   = (settings?.locale ?? 'ru') == 'ru';

        return Container(
          decoration: BoxDecoration(
            color: cs.surface,
            borderRadius: BorderRadius.circular(AppTheme.radiusLg),
            border: Border.all(color: ext.border),
          ),
          child: Column(
            children: [
              // Тема
              _SettingsToggleRow(
                icon: isDark ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
                label: 'Тёмная тема',
                value: isDark,
                onChanged: (v) => context.read<SettingsBloc>().add(
                  SettingsEvent.updateAppThemeMode(
                    themeMode: v ? 'dark' : 'light',
                  ),
                ),
                isLast: false,
                ext: ext, tt: tt,
              ),
              Divider(height: 1, color: ext.divider, indent: 16),

              // Язык
              _SettingsToggleRow(
                icon: Icons.language_outlined,
                label: 'Русский язык',
                value: isRu,
                onChanged: (v) => context.read<SettingsBloc>().add(
                  SettingsEvent.updateAppLocalization(
                    locale: v ? 'ru' : 'en',
                  ),
                ),
                isLast: true,
                ext: ext, tt: tt,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _NotificationsCard extends StatelessWidget {
  const _NotificationsCard({
    required this.notifyChats,
    required this.notifyNews,
    required this.notifyEvents,
    required this.onChats,
    required this.onNews,
    required this.onEvents,
    required this.cs,
    required this.ext,
    required this.tt,
  });

  final bool notifyChats, notifyNews, notifyEvents;
  final ValueChanged<bool> onChats, onNews, onEvents;
  final ColorScheme cs;
  final AppColors ext;
  final TextTheme tt;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: cs.surface,
        borderRadius: BorderRadius.circular(AppTheme.radiusLg),
        border: Border.all(color: ext.border),
      ),
      child: Column(
        children: [
          _SettingsToggleRow(
            icon: Icons.chat_bubble_outline,
            label: 'Чаты',
            value: notifyChats,
            onChanged: onChats,
            isLast: false,
            ext: ext, tt: tt,
          ),
          Divider(height: 1, color: ext.divider, indent: 16),
          _SettingsToggleRow(
            icon: Icons.campaign_outlined,
            label: 'Объявления',
            value: notifyNews,
            onChanged: onNews,
            isLast: false,
            ext: ext, tt: tt,
          ),
          Divider(height: 1, color: ext.divider, indent: 16),
          _SettingsToggleRow(
            icon: Icons.event_outlined,
            label: 'События',
            value: notifyEvents,
            onChanged: onEvents,
            isLast: true,
            ext: ext, tt: tt,
          ),
        ],
      ),
    );
  }
}

class _SettingsToggleRow extends StatelessWidget {
  const _SettingsToggleRow({
    required this.icon,
    required this.label,
    required this.value,
    required this.onChanged,
    required this.isLast,
    required this.ext,
    required this.tt,
  });

  final IconData icon;
  final String label;
  final bool value, isLast;
  final ValueChanged<bool> onChanged;
  final AppColors ext;
  final TextTheme tt;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
      child: Row(
        children: [
          Icon(icon, size: 18, color: ext.textTertiary),
          const SizedBox(width: 12),
          Expanded(
            child: Text(label, style: tt.labelLarge),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: cs.primary,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ],
      ),
    );
  }
}

class _LogoutButton extends StatelessWidget {
  const _LogoutButton({required this.cs, required this.ext, required this.tt});
  final ColorScheme cs;
  final AppColors ext;
  final TextTheme tt;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton.icon(
        onPressed: () => _confirmLogout(context),
        icon: const Icon(Icons.logout_outlined, size: 18),
        label: const Text('Выйти из аккаунта'),
        style: ElevatedButton.styleFrom(
          backgroundColor: ext.errorBg,
          foregroundColor: ext.errorFg,
          elevation: 0,
          side: BorderSide(color: ext.errorFg.withValues(alpha: .3)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppTheme.radiusMd),
          ),
        ),
      ),
    );
  }

  void _confirmLogout(BuildContext context) {
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;

    showModalBottomSheet(
      context: context,
      backgroundColor: cs.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppTheme.radiusLg),
        ),
      ),
      builder: (_) => Padding(
        padding: EdgeInsets.fromLTRB(16, 20, 16, MediaQuery.of(context).padding.bottom + 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Ручка
            Container(
              width: 36, height: 4,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: ext.border,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Text('Выйти из аккаунта?', style: tt.titleMedium),
            const SizedBox(height: 8),
            Text(
              'Все локальные данные будут удалены.',
              style: tt.bodyMedium?.copyWith(color: ext.textSecondary),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 48,
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Отмена'),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: SizedBox(
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        context.read<AuthBloc>().add(AuthEvent.logout());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ext.errorBg,
                        foregroundColor: ext.errorFg,
                        elevation: 0,
                      ),
                      child: const Text('Выйти'),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ════════════════════════════════════════════════════════════
// Вспомогательные виджеты
// ════════════════════════════════════════════════════════════
class _SectionLabel extends StatelessWidget {
  const _SectionLabel({required this.label, required this.ext, required this.tt});
  final String label;
  final AppColors ext;
  final TextTheme tt;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: tt.titleMedium,
    );
  }
}

class _MetaLine extends StatelessWidget {
  const _MetaLine({
    required this.icon,
    required this.label,
    required this.ext,
    required this.tt,
  });
  final IconData icon;
  final String label;
  final AppColors ext;
  final TextTheme tt;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 14, color: ext.textTertiary),
        const SizedBox(width: 5),
        Expanded(
          child: Text(
            label,
            style: tt.labelSmall?.copyWith(color: ext.textSecondary),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
