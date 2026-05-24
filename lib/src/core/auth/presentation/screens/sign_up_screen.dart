import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sfu/src/core/auth/presentation/bloc/auth_bloc.dart';
import 'package:sfu/src/core/theme/app_theme.dart';
import 'package:sfu/src/core/widgets/loading_indicator_widget.dart';

enum _Role { student, staff }

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  _Role _role = _Role.student;
  String _group = '-';
  bool _obscure1 = true;
  bool _obscure2 = true;

  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _pass1Ctrl = TextEditingController();
  final _pass2Ctrl = TextEditingController();

  // Список групп (из оригинального кода)
  static const _groups = [
    '-',
    'КИ23-05Б (1 подгруппа)',
    'КИ25-13Б (1 подгруппа)',
    'КИ22-13Б (1 подгруппа)',
    'КИ22-07Б (1 подгруппа)',
  ];

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _pass1Ctrl.dispose();
    _pass2Ctrl.dispose();
    super.dispose();
  }

  void _submit(BuildContext context) {
    FocusScope.of(context).unfocus();
    context.read<AuthBloc>().add(
      AuthEvent.signUp(
        email: _emailCtrl.text.trim(),
        password1: _pass1Ctrl.text,
        password2: _pass2Ctrl.text,
        name: _nameCtrl.text.trim(),
        role: _role == _Role.student ? 'student' : 'teacher',
        group: _role == _Role.student ? _group : '-',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt = Theme.of(context).textTheme;

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => FocusScope.of(context).unfocus(),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) => state.maybeWhen(
          authorized: () => Navigator.pushReplacementNamed(context, '/home'),
          unauthorized: () => Navigator.pop(context),
          error: (msg) =>
              ScaffoldMessenger.of(context).showSnackBar(_errorSnack(msg, ext)),
          orElse: () => {},
        ),
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            scrolledUnderElevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: cs.primary),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          body: SafeArea(
            top: false,
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _AuthLogo(cs: cs),

                  const SizedBox(height: 24),

                  Text(
                    'Регистрация',
                    style: tt.headlineSmall,
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 24),

                  _RolePill(
                    selected: _role,
                    onChanged: (r) => setState(() {
                      _role = r;
                      if (r == _Role.staff) _group = '-';
                    }),
                    cs: cs,
                    ext: ext,
                    tt: tt,
                  ),

                  const SizedBox(height: 24),

                  TextField(
                    controller: _nameCtrl,
                    textCapitalization: TextCapitalization.words,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person_outline,
                        size: 20,
                        color: ext.textTertiary,
                      ),
                      labelText: 'ФИО',
                      hintText: 'Иванов Иван Иванович',
                    ),
                  ),

                  const SizedBox(height: 14),

                  TextField(
                    controller: _emailCtrl,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.mail_outline,
                        size: 20,
                        color: ext.textTertiary,
                      ),
                      labelText: _role == _Role.student
                          ? 'Корпоративная почта'
                          : 'Рабочая почта',
                      hintText: _role == _Role.student
                          ? 'student@sfu-kras.ru'
                          : 'teacher@sfu-kras.ru',
                    ),
                  ),

                  const SizedBox(height: 14),

                  TextField(
                    controller: _pass1Ctrl,
                    obscureText: _obscure1,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        size: 20,
                        color: ext.textTertiary,
                      ),
                      labelText: 'Пароль',
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscure1
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          size: 20,
                          color: ext.textTertiary,
                        ),
                        onPressed: () => setState(() => _obscure1 = !_obscure1),
                      ),
                    ),
                  ),

                  const SizedBox(height: 14),

                  TextField(
                    controller: _pass2Ctrl,
                    obscureText: _obscure2,
                    textInputAction: TextInputAction.done,
                    onSubmitted: (_) =>
                        _role == _Role.staff ? _submit(context) : null,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        size: 20,
                        color: ext.textTertiary,
                      ),
                      labelText: 'Повторите пароль',
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscure2
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          size: 20,
                          color: ext.textTertiary,
                        ),
                        onPressed: () => setState(() => _obscure2 = !_obscure2),
                      ),
                    ),
                  ),

                  if (_role == _Role.student) ...[
                    const SizedBox(height: 14),
                    _GroupDropdown(
                      value: _group,
                      groups: _groups,
                      onChanged: (v) => setState(() => _group = v ?? '-'),
                      ext: ext,
                      tt: tt,
                      cs: cs,
                    ),
                  ],

                  const SizedBox(height: 28),

                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) => SizedBox(
                      height: 52,
                      child: ElevatedButton(
                        onPressed: state.maybeWhen(
                          loading: () => null,
                          orElse: () =>
                              () => _submit(context),
                        ),
                        child: state.maybeWhen(
                          loading: () => const LoadingIndicatorWidget(),
                          orElse: () => const Text('Создать аккаунт'),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Уже есть аккаунт?',
                        style: tt.bodyMedium?.copyWith(
                          color: ext.textSecondary,
                        ),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                          'Войти',
                          style: tt.labelLarge?.copyWith(color: cs.primary),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _GroupDropdown extends StatelessWidget {
  const _GroupDropdown({
    required this.value,
    required this.groups,
    required this.onChanged,
    required this.ext,
    required this.tt,
    required this.cs,
  });

  final String value;
  final List<String> groups;
  final ValueChanged<String?> onChanged;
  final AppColors ext;
  final TextTheme tt;
  final ColorScheme cs;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: cs.surface,
        borderRadius: BorderRadius.circular(AppTheme.radiusMd),
        border: Border.all(color: ext.border),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          icon: Icon(Icons.expand_more, color: ext.textTertiary),
          style: tt.bodyLarge?.copyWith(fontSize: 15),
          dropdownColor: cs.surface,
          borderRadius: BorderRadius.circular(AppTheme.radiusMd),
          hint: Row(
            children: [
              Icon(Icons.groups_outlined, size: 20, color: ext.textTertiary),
              const SizedBox(width: 10),
              Text(
                'Выберите группу',
                style: tt.bodyMedium?.copyWith(color: ext.textTertiary),
              ),
            ],
          ),
          items: groups
              .map(
                (g) => DropdownMenuItem(
                  value: g,
                  child: Text(g == '-' ? 'Не выбрана' : g),
                ),
              )
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}

class _AuthLogo extends StatelessWidget {
  const _AuthLogo({required this.cs});
  final ColorScheme cs;

  @override
  Widget build(BuildContext context) => Column(
    children: [
      SvgPicture.asset(
        'assets/images/logo.svg',
        height: 72,
        colorFilter: ColorFilter.mode(cs.primary, BlendMode.srcIn),
      ),
    ],
  );
}

class _RolePill extends StatelessWidget {
  const _RolePill({
    required this.selected,
    required this.onChanged,
    required this.cs,
    required this.ext,
    required this.tt,
  });

  final _Role selected;
  final ValueChanged<_Role> onChanged;
  final ColorScheme cs;
  final AppColors ext;
  final TextTheme tt;

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      color: ext.surfaceTinted,
      borderRadius: BorderRadius.circular(AppTheme.radiusMd),
    ),
    padding: const EdgeInsets.all(4),
    child: Row(
      children: [
        _Seg(
          icon: Icons.school_outlined,
          label: 'Студент',
          isSelected: selected == _Role.student,
          onTap: () => onChanged(_Role.student),
          cs: cs,
          ext: ext,
          tt: tt,
        ),
        _Seg(
          icon: Icons.work_outline,
          label: 'Сотрудник',
          isSelected: selected == _Role.staff,
          onTap: () => onChanged(_Role.staff),
          cs: cs,
          ext: ext,
          tt: tt,
        ),
      ],
    ),
  );
}

class _Seg extends StatelessWidget {
  const _Seg({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
    required this.cs,
    required this.ext,
    required this.tt,
  });

  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final ColorScheme cs;
  final AppColors ext;
  final TextTheme tt;

  @override
  Widget build(BuildContext context) => Expanded(
    child: GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? cs.surface : cs.surface.withValues(alpha: 0),
          borderRadius: BorderRadius.circular(AppTheme.radiusSm),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 16,
              color: isSelected ? cs.primary : ext.textSecondary,
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: tt.labelLarge?.copyWith(
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                color: isSelected ? ext.textPrimary : ext.textSecondary,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

SnackBar _errorSnack(String msg, AppColors ext) => SnackBar(
  backgroundColor: ext.errorBg,
  content: Row(
    children: [
      Icon(Icons.error_outline, color: ext.errorFg, size: 18),
      const SizedBox(width: 8),
      Expanded(
        child: Text(msg, style: TextStyle(color: ext.errorFg)),
      ),
    ],
  ),
);
