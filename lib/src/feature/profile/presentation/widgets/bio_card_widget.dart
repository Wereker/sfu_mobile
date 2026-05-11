import 'package:flutter/material.dart';
import 'package:sfu/src/core/theme/app_theme.dart';

class BioCard extends StatelessWidget {
  const BioCard({
    super.key,
    required this.controller,
    required this.isEditing,
    required this.onToggle,
  });

  final TextEditingController controller;
  final bool isEditing;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    final cs  = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt  = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        color: cs.surface,
        borderRadius: BorderRadius.circular(AppTheme.radiusLg),
        border: Border.all(color: ext.border),
      ),
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.person_outline, size: 16, color: ext.textTertiary),
              const SizedBox(width: 8),
              Text('Краткая биография',
                  style: tt.labelSmall?.copyWith(color: ext.textSecondary)),
              const Spacer(),
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
          const SizedBox(height: 10),
          isEditing
              ? TextField(
            controller: controller,
            autofocus: true,
            maxLines: 5,
            minLines: 3,
            textCapitalization: TextCapitalization.sentences,
            style: tt.bodyLarge?.copyWith(fontSize: 15, height: 1.5),
            decoration: InputDecoration(
              hintText:
              'Расскажите о своей научной деятельности...',
              hintStyle:
              tt.bodyMedium?.copyWith(color: ext.textTertiary),
              isDense: true,
              contentPadding: EdgeInsets.zero,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          )
              : controller.text.isEmpty
              ? Text(
            'Нажмите редактировать чтобы добавить информацию о себе',
            style: tt.bodyMedium
                ?.copyWith(color: ext.textTertiary, height: 1.5),
          )
              : Text(
            controller.text,
            style: tt.bodyLarge?.copyWith(
                fontSize: 15, height: 1.5, color: ext.textPrimary),
          ),
        ],
      ),
    );
  }
}