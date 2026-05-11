import 'package:flutter/material.dart';

class PlaceholderScreen extends StatelessWidget {
  const PlaceholderScreen({super.key, required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(label, style: Theme.of(context).textTheme.titleLarge),
    );
  }
}