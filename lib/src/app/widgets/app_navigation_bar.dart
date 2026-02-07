import 'package:flutter/material.dart';

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
    return Container(
      margin: EdgeInsets.fromLTRB(
        12,
        0,
        12,
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
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.newspaper),
              label: "Новости",
            ),
            NavigationDestination(
              icon: Icon(Icons.event_note),
              label: "Расписание",
            ),
            NavigationDestination(icon: Icon(Icons.chat), label: "Чат"),
            NavigationDestination(
              icon: Icon(Icons.calendar_month),
              label: "Календарь",
            ),
            NavigationDestination(
              icon: Icon(Icons.my_library_books),
              label: "Домашняя",
            ),
          ],
        ),
      ),
    );
  }
}
