import 'package:flutter/material.dart';
import 'package:sfu/src/core/localization/app_localizations.dart';

class AppNavigationBar extends StatelessWidget {
  final int currentIndex;
  final void Function(int index) onDestinationSelected;

  const AppNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return Container(
      margin: EdgeInsets.fromLTRB(
        80,
        0,
        80,
        MediaQuery.of(context).padding.bottom + 8,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor.withValues(alpha: 0.3),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: NavigationBar(
          selectedIndex: currentIndex,
          onDestinationSelected: onDestinationSelected,
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.newspaper),
              label: t!.homeAppBarNews,
            ),
            NavigationDestination(
              icon: Icon(Icons.event_note),
              label: t.homeAppBarTimetable,
            ),
            NavigationDestination(icon: Icon(Icons.chat), label: t.homeAppBarChat),
          ],
        ),
      ),
    );
  }
}
