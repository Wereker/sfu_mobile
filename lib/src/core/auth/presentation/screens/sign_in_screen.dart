import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sfu/src/core/auth/presentation/bloc/auth_bloc.dart';
import 'package:sfu/src/core/theme/app_theme.dart';
import 'package:sfu/src/core/widgets/loading_indicator_widget.dart';

enum _Role { student, staff }

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  _Role _role = _Role.student;
  bool _obscure = true;

  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  void _submit(BuildContext context) {
    FocusScope.of(context).unfocus();
    context.read<AuthBloc>().add(
      AuthEvent.signIn(
        email: _emailCtrl.text.trim(),
        password: _passwordCtrl.text,
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
          authorized: () async {
            Navigator.pushReplacementNamed(context, '/home');
            return null;
          },
          error: (msg) =>
              ScaffoldMessenger.of(context).showSnackBar(_errorSnack(msg, ext)),
          orElse: () {},
        ),
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 48),

                  _AuthLogo(cs: cs),

                  const SizedBox(height: 32),

                  Text(
                    'Вход в аккаунт',
                    style: tt.headlineSmall,
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 28),

                  _RolePill(
                    selected: _role,
                    onChanged: (r) => setState(() => _role = r),
                    cs: cs,
                    ext: ext,
                    tt: tt,
                  ),

                  const SizedBox(height: 24),

                  AutofillGroup(
                    onDisposeAction: AutofillContextAction.commit,
                    child: Column(
                      children: [
                        TextField(
                          controller: _emailCtrl,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          autofillHints: const [
                            AutofillHints.username,
                            AutofillHints.email,
                          ],
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.mail_outline,
                              size: 20,
                              color: ext.textTertiary,
                            ),
                            labelText: _role == _Role.student
                                ? 'Почта'
                                : 'Рабочая почта',
                            hintText: _role == _Role.student
                                ? 'student@sfu-kras.ru'
                                : 'teacher@sfu-kras.ru',
                          ),
                        ),

                        const SizedBox(height: 14),

                        TextField(
                          controller: _passwordCtrl,
                          obscureText: _obscure,
                          textInputAction: TextInputAction.done,
                          autofillHints: const [AutofillHints.password],
                          onSubmitted: (_) => _submit(context),
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.lock_outline,
                              size: 20,
                              color: ext.textTertiary,
                            ),
                            labelText: 'Пароль',
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscure
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                size: 20,
                                color: ext.textTertiary,
                              ),
                              onPressed: () =>
                                  setState(() => _obscure = !_obscure),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, '/resetPassword'),
                      child: Text(
                        'Забыли пароль?',
                        style: tt.labelLarge?.copyWith(color: cs.primary),
                      ),
                    ),
                  ),

                  const SizedBox(height: 8),

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
                          orElse: () => const Text('Войти'),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Нет аккаунта?',
                        style: tt.bodyMedium?.copyWith(
                          color: ext.textSecondary,
                        ),
                      ),
                      TextButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, '/signUp'),
                        child: Text(
                          'Зарегистрироваться',
                          style: tt.labelLarge?.copyWith(color: cs.primary),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _AuthLogo extends StatelessWidget {
  const _AuthLogo({required this.cs});
  final ColorScheme cs;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          'assets/images/logo.svg',
          height: 72,
          colorFilter: ColorFilter.mode(cs.primary, BlendMode.srcIn),
        ),
      ],
    );
  }
}

/// Pill-переключатель Студент / Сотрудник
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
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ext.surfaceTinted,
        borderRadius: BorderRadius.circular(AppTheme.radiusMd),
      ),
      padding: const EdgeInsets.all(4),
      child: Row(
        children: [
          _PillSegment(
            icon: Icons.school_outlined,
            label: 'Студент',
            isSelected: selected == _Role.student,
            onTap: () => onChanged(_Role.student),
            cs: cs,
            ext: ext,
            tt: tt,
          ),
          _PillSegment(
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
}

class _PillSegment extends StatelessWidget {
  const _PillSegment({
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
  Widget build(BuildContext context) {
    return Expanded(
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
