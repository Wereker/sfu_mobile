import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sfu/src/core/auth/presentation/bloc/auth_bloc.dart';
import 'package:sfu/src/core/theme/app_theme.dart';
import 'package:sfu/src/core/widgets/loading_indicator_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _obscure1 = true;
  bool _obscure2 = true;

  final _surnameCtrl    = TextEditingController(); // фамилия
  final _nameCtrl       = TextEditingController(); // имя
  final _patronymicCtrl = TextEditingController(); // отчество
  final _emailCtrl      = TextEditingController();
  final _pass1Ctrl      = TextEditingController();
  final _pass2Ctrl      = TextEditingController();

  @override
  void dispose() {
    _surnameCtrl.dispose();
    _nameCtrl.dispose();
    _patronymicCtrl.dispose();
    _emailCtrl.dispose();
    _pass1Ctrl.dispose();
    _pass2Ctrl.dispose();
    super.dispose();
  }

  void _submit(BuildContext context) {
    FocusScope.of(context).unfocus();
    context.read<AuthBloc>().add(
      AuthEvent.signUp(
        name:        _nameCtrl.text.trim(),
        surname:     _surnameCtrl.text.trim(),
        patronymic:  _patronymicCtrl.text.trim(),
        email:       _emailCtrl.text.trim(),
        password1:   _pass1Ctrl.text,
        password2:   _pass2Ctrl.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cs  = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt  = Theme.of(context).textTheme;

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => FocusScope.of(context).unfocus(),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) => state.maybeWhen(
          authorized: () =>
              Navigator.pushReplacementNamed(context, '/home'),
          registered: (email) {
            Navigator.pushReplacementNamed(
              context,
              '/signIn',
              arguments: {'email': email},
            );
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Аккаунт создан. Войдите в систему.')),
            );
            return null;
          },
          error: (msg) => ScaffoldMessenger.of(context)
              .showSnackBar(_errorSnack(msg, ext)),
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
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 480),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Лого
                      Center(
                        child: SvgPicture.asset(
                          'assets/images/logo.svg',
                          height: 64,
                          colorFilter: ColorFilter.mode(
                              cs.primary, BlendMode.srcIn),
                        ),
                      ),

                      const SizedBox(height: 20),

                      Text(
                        'Регистрация',
                        style: tt.headlineSmall,
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 6),

                      // Плашка о том что только студенты
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 10),
                        decoration: BoxDecoration(
                          color: ext.infoBg,
                          borderRadius:
                          BorderRadius.circular(AppTheme.radiusMd),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.info_outline,
                                size: 16, color: ext.infoFg),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                'Самостоятельная регистрация доступна только для студентов. '
                                    'Если вы сотрудник — обратитесь к администратору кафедры для создания аккаунта.',
                                style: tt.bodySmall
                                    ?.copyWith(color: ext.infoFg),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Фамилия
                      TextField(
                        controller: _surnameCtrl,
                        textCapitalization: TextCapitalization.words,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person_outline,
                              size: 20, color: ext.textTertiary),
                          labelText: 'Фамилия',
                          hintText: 'Иванов',
                        ),
                      ),

                      const SizedBox(height: 12),

                      // Имя
                      TextField(
                        controller: _nameCtrl,
                        textCapitalization: TextCapitalization.words,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person_outline,
                              size: 20, color: ext.textTertiary),
                          labelText: 'Имя',
                          hintText: 'Иван',
                        ),
                      ),

                      const SizedBox(height: 12),

                      // Отчество
                      TextField(
                        controller: _patronymicCtrl,
                        textCapitalization: TextCapitalization.words,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person_outline,
                              size: 20, color: ext.textTertiary),
                          labelText: 'Отчество',
                          hintText: 'Иванович (необязательно)',
                        ),
                      ),

                      const SizedBox(height: 12),

                      // Email
                      TextField(
                        controller: _emailCtrl,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.mail_outline,
                              size: 20, color: ext.textTertiary),
                          labelText: 'Корпоративная почта',
                          hintText: 'student@sfu-kras.ru',
                        ),
                      ),

                      const SizedBox(height: 12),

                      // Пароль
                      TextField(
                        controller: _pass1Ctrl,
                        obscureText: _obscure1,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock_outline,
                              size: 20, color: ext.textTertiary),
                          labelText: 'Пароль',
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscure1
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              size: 20,
                              color: ext.textTertiary,
                            ),
                            onPressed: () =>
                                setState(() => _obscure1 = !_obscure1),
                          ),
                        ),
                      ),

                      const SizedBox(height: 12),

                      // Повтор пароля
                      TextField(
                        controller: _pass2Ctrl,
                        obscureText: _obscure2,
                        textInputAction: TextInputAction.done,
                        onSubmitted: (_) => _submit(context),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock_outline,
                              size: 20, color: ext.textTertiary),
                          labelText: 'Повторите пароль',
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscure2
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              size: 20,
                              color: ext.textTertiary,
                            ),
                            onPressed: () =>
                                setState(() => _obscure2 = !_obscure2),
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Кнопка
                      BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, state) => SizedBox(
                          height: 52,
                          child: ElevatedButton(
                            onPressed: state.maybeWhen(
                              loading: () => null,
                              orElse: () => () => _submit(context),
                            ),
                            child: state.maybeWhen(
                              loading: () =>
                              const LoadingIndicatorWidget(),
                              orElse: () =>
                              const Text('Создать аккаунт'),
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
                                color: ext.textSecondary),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text(
                              'Войти',
                              style: tt.labelLarge
                                  ?.copyWith(color: cs.primary),
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