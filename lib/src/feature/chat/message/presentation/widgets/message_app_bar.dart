import 'package:flutter/material.dart';
import 'package:sfu/src/core/theme/app_theme.dart';
import 'package:sfu/src/core/widgets/initials_avatar.dart';

class MessageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MessageAppBar({super.key, required this.chatTitle});
  final String chatTitle;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 1);

  @override
  Widget build(BuildContext context) {
    final cs  = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt  = Theme.of(context).textTheme;

    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: cs.primary),
        onPressed: () => Navigator.pop(context),
      ),
      titleSpacing: 0,
      title: Row(
        children: [
          InitialsAvatar(name: chatTitle, size: 36),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(chatTitle,
                    style: tt.titleMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),
                Text('в сети',
                    style: tt.labelSmall?.copyWith(
                        color: ext.success, height: 1.2)),
              ],
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.more_vert, color: ext.textSecondary),
          onPressed: () {},
        ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Divider(height: 1, color: ext.border),
      ),
    );
  }
}