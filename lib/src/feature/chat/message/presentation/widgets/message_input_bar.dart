import 'package:flutter/material.dart';
import 'package:sfu/src/core/theme/app_theme.dart';

class MessageInputBar extends StatefulWidget {
  const MessageInputBar({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.onSend,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final VoidCallback onSend;

  @override
  State<MessageInputBar> createState() => _MessageInputBarState();
}

class _MessageInputBarState extends State<MessageInputBar> {
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      final has = widget.controller.text.trim().isNotEmpty;
      if (has != _hasText) setState(() => _hasText = has);
    });
  }

  @override
  Widget build(BuildContext context) {
    final cs  = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt  = Theme.of(context).textTheme;

    final bottom = MediaQuery.of(context).viewInsets.bottom +
        MediaQuery.of(context).padding.bottom;

    return Container(
      padding: EdgeInsets.fromLTRB(12, 8, 12, bottom + 8),
      decoration: BoxDecoration(
        color: cs.surface,
        border: Border(top: BorderSide(color: ext.border)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Container(
              constraints: const BoxConstraints(maxHeight: 120),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(AppTheme.radiusMd),
                border: Border.all(color: ext.border),
              ),
              child: TextField(
                controller: widget.controller,
                focusNode:  widget.focusNode,
                maxLines: null,
                minLines: 1,
                textInputAction: TextInputAction.newline,
                style: tt.bodyLarge?.copyWith(fontSize: 15),
                decoration: InputDecoration(
                  hintText: 'Сообщение…',
                  hintStyle: tt.bodyMedium?.copyWith(color: ext.textTertiary),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 14, vertical: 10),
                  isDense: true,
                ),
              ),
            ),
          ),

          const SizedBox(width: 8),

          AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            width: 40, height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _hasText ? cs.primary : ext.divider,
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: _hasText ? widget.onSend : null,
              icon: Icon(
                Icons.send_rounded,
                size: 18,
                color: _hasText ? cs.onPrimary : ext.textTertiary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}