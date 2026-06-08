import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sfu/src/core/auth/presentation/bloc/auth_bloc.dart';
import 'package:sfu/src/core/l10n/strings.g.dart';
import 'package:sfu/src/core/theme/app_theme.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    final t   = Translations.of(context);
    final ext = Theme.of(context).extension<AppColors>()!;

    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton.icon(
        onPressed: () => _confirmLogout(context),
        icon: const Icon(Icons.logout_outlined, size: 18),
        label: Text(t.profile.logout.button),
        style: ElevatedButton.styleFrom(
          backgroundColor: ext.errorBg,
          foregroundColor: ext.errorFg,
          elevation: 0,
          side: BorderSide(color: ext.errorFg.withValues(alpha: .3)),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppTheme.radiusMd)),
        ),
      ),
    );
  }

  void _confirmLogout(BuildContext context) {
    final t   = Translations.of(context);
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt  = Theme.of(context).textTheme;
    final cs  = Theme.of(context).colorScheme;

    showModalBottomSheet(
      context: context,
      backgroundColor: cs.surface,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(AppTheme.radiusLg))),
      builder: (_) => Padding(
        padding: EdgeInsets.fromLTRB(
            16, 20, 16, MediaQuery.of(context).padding.bottom + 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 36, height: 4,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                  color: ext.border,
                  borderRadius: BorderRadius.circular(2)),
            ),
            Text(t.profile.logout.title, style: tt.titleMedium),
            const SizedBox(height: 8),
            Text(
              t.profile.logout.subtitle,
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
                      child: Text(t.profile.logout.cancel),
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
                        context
                            .read<AuthBloc>()
                            .add(const AuthEvent.logout());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ext.errorBg,
                        foregroundColor: ext.errorFg,
                        elevation: 0,
                      ),
                      child: Text(t.profile.logout.confirm),
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