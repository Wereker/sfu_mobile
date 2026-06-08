import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sfu/src/core/auth/presentation/bloc/auth_bloc.dart';
import 'package:sfu/src/core/l10n/strings.g.dart';
import 'package:sfu/src/core/theme/app_theme.dart';
import 'package:sfu/src/core/widgets/loading_indicator_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
    context.read<AuthBloc>().add(AuthEvent.signIn(
      email: _emailCtrl.text.trim(),
      password: _passwordCtrl.text,
    ));
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
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
          error: (msg) => ScaffoldMessenger.of(context)
              .showSnackBar(_errorSnack(msg, ext)),
          orElse: () => {},
        ),
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height / 15 + 24),
                  _AuthLogo(cs: cs),
                  const SizedBox(height: 32),
                  Text(t.auth.signIn.title,
                      style: tt.headlineSmall,
                      textAlign: TextAlign.center),
                  SizedBox(height: MediaQuery.of(context).size.height / 15 + 24),
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
                            prefixIcon: Icon(Icons.mail_outline,
                                size: 20, color: ext.textTertiary),
                            labelText: t.auth.signIn.emailLabel,
                            hintText: t.auth.signIn.emailHint,
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
                            prefixIcon: Icon(Icons.lock_outline,
                                size: 20, color: ext.textTertiary),
                            labelText: t.auth.signIn.passwordLabel,
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
                      child: Text(t.auth.signIn.forgotPassword,
                          style: tt.labelLarge?.copyWith(color: cs.primary)),
                    ),
                  ),
                  const SizedBox(height: 8),
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
                          orElse: () => Text(t.auth.signIn.submitBtn),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(t.auth.signIn.noAccount,
                          style: tt.bodyMedium
                              ?.copyWith(color: ext.textSecondary)),
                      TextButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, '/signUp'),
                        child: Text(t.auth.signIn.register,
                            style:
                            tt.labelLarge?.copyWith(color: cs.primary)),
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
  Widget build(BuildContext context) => Column(
    children: [
      SvgPicture.asset(
        'assets/images/logo.svg',
        height: 72,
        colorFilter:
        ColorFilter.mode(cs.primary, BlendMode.srcIn),
      ),
    ],
  );
}

SnackBar _errorSnack(String msg, AppColors ext) => SnackBar(
  backgroundColor: ext.errorBg,
  content: Row(
    children: [
      Icon(Icons.error_outline, color: ext.errorFg, size: 18),
      const SizedBox(width: 8),
      Expanded(child: Text(msg, style: TextStyle(color: ext.errorFg))),
    ],
  ),
);