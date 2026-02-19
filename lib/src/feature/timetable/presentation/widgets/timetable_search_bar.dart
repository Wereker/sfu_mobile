import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sfu/src/feature/timetable/presentation/bloc/timetable_bloc.dart';

class TimetableSearchBar extends StatelessWidget {
  const TimetableSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Autocomplete<String>(
        optionsBuilder: (TextEditingValue textEditingValue) {
          if (textEditingValue.text.isEmpty) return const Iterable<String>.empty();

          final allItems = [
            'КИ22-07Б (1 подгруппа)',
            'КИ25-13Б (2 подгруппа)',
            'УБ21-14Б',
            'КИ25-03Б (2 подгруппа)',
            'КИ22-11Б (1 подгруппа)',
            'КИ23-05Б (1 подгруппа)',
          ];

          return allItems.where((item) =>
              item.toLowerCase().contains(textEditingValue.text.toLowerCase())
          );
        },

        onSelected: (String selection) {
          context.read<TimetableBloc>().add(TimetableEvent.loadDataForTarget(selection));
        },

        fieldViewBuilder: (context, textEditingController, focusNode, onFieldSubmitted) {
          return TextField(
            controller: textEditingController,
            focusNode: focusNode,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              hintText: 'Поиск предмета...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(width: 1.0, color: Theme.of(context).dividerColor),
              ),
              filled: true,
              fillColor: Theme.of(context).cardColor,
            ),
            onSubmitted: (value) => onFieldSubmitted(),
          );
        },

        optionsViewBuilder: (context, onSelected, options) {
          return Align(
            alignment: Alignment.topLeft,
            child: Material(
              elevation: 0,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 220),
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: options.length,
                  itemBuilder: (context, index) {
                    final item = options.elementAt(index);
                    return ListTile(
                      title: Text(item),
                      onTap: () => onSelected(item),
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}