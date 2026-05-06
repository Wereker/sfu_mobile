import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sfu/src/core/auth/presentation/bloc/auth_bloc.dart';
import 'package:sfu/src/core/theme/app_theme.dart';
import 'package:sfu/src/core/widgets/loading_indicator_widget.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _pass1Ctrl = TextEditingController();
  final _pass2Ctrl = TextEditingController();
  bool _obscure1 = true;
  bool _obscure2 = true;

  @override
  void dispose() {
    _pass1Ctrl.dispose();
    _pass2Ctrl.dispose();
    super.dispose();
  }

  void _submit(BuildContext context) {
    FocusScope.of(context).unfocus();
    context.read<AuthBloc>().add(
      AuthEvent.resetPassword(newPassword: _pass2Ctrl.text),
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
          unauthorized: () => Navigator.pop(context),
          error: (msg) => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: ext.errorBg,
              content: Row(
                children: [
                  Icon(Icons.error_outline, color: ext.errorFg, size: 18),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(msg,
                        style: TextStyle(color: ext.errorFg)),
                  ),
                ],
              ),
            ),
          ),
          orElse: () {},
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
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 24),

                  Column(
                    children: [
                      SvgPicture.asset(
                        'assets/images/logo.svg',
                        height: 72,
                        colorFilter:
                            ColorFilter.mode(cs.primary, BlendMode.srcIn),
                      ),
                    ],
                  ),

                  const SizedBox(height: 32),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Новый пароль',
                          style: tt.headlineSmall,
                          textAlign: TextAlign.center),
                      const SizedBox(width: 10),
                      Icon(Icons.lock_reset_outlined,
                          size: 28, color: cs.primary),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Придумайте надёжный пароль.\nПароли должны совпадать.',
                    style: tt.bodyMedium?.copyWith(color: ext.textSecondary),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 32),

                  TextField(
                    controller: _pass1Ctrl,
                    obscureText: _obscure1,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_outline,
                          size: 20, color: ext.textTertiary),
                      labelText: 'Новый пароль',
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

                  const SizedBox(height: 14),

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

                  const SizedBox(height: 28),

                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) => SizedBox(
                      height: 52,
                      child: ElevatedButton(
                        onPressed: state.maybeWhen(
                          loading: () => null,
                          orElse: () => () => _submit(context),
                        ),
                        child: state.maybeWhen(
                          loading: () => const LoadingIndicatorWidget(),
                          orElse: () => const Text('Сохранить пароль'),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Center(
                    child: TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        'Вернуться ко входу',
                        style: tt.labelLarge
                            ?.copyWith(color: ext.textSecondary),
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
