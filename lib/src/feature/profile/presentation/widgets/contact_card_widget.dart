import 'package:flutter/material.dart';
import 'package:sfu/src/core/l10n/strings.g.dart';
import 'package:sfu/src/core/theme/app_theme.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({
    super.key,
    required this.phoneCtrl,
    required this.emailCtrl,
    required this.tgCtrl,
    required this.editingPhone,
    required this.editingEmail,
    required this.editingTg,
    required this.onTogglePhone,
    required this.onToggleEmail,
    required this.onToggleTg,
  });

  final TextEditingController phoneCtrl, emailCtrl, tgCtrl;
  final bool editingPhone, editingEmail, editingTg;
  final VoidCallback onTogglePhone, onToggleEmail, onToggleTg;

  @override
  Widget build(BuildContext context) {
    final t   = Translations.of(context);
    final cs  = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColors>()!;

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
            label: t.profile.contacts.phone,
            hint: '+7 900 000 00 00',
            controller: phoneCtrl,
            isEditing: editingPhone,
            onToggle: onTogglePhone,
          ),
          Divider(height: 1, color: ext.divider, indent: 16),
          _EditableContactRow(
            icon: Icons.mail_outline,
            label: t.profile.contacts.email,
            hint: 'example@sfu-kras.ru',
            controller: emailCtrl,
            isEditing: editingEmail,
            onToggle: onToggleEmail,
          ),
          Divider(height: 1, color: ext.divider, indent: 16),
          _EditableContactRow(
            icon: Icons.telegram,
            label: t.profile.contacts.telegram,
            hint: '@username',
            controller: tgCtrl,
            isEditing: editingTg,
            onToggle: onToggleTg,
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
  });

  final IconData icon;
  final String label, hint;
  final TextEditingController controller;
  final bool isEditing;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    final cs  = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt  = Theme.of(context).textTheme;

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
                    style:
                    tt.labelSmall?.copyWith(color: ext.textSecondary)),
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