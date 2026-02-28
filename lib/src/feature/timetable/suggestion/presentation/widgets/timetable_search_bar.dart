import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sfu/src/feature/timetable/presentation/bloc/timetable_bloc.dart';
import 'package:sfu/src/feature/timetable/suggestion/presentation/bloc/suggestions_bloc.dart';

class TimetableSearchBar extends StatelessWidget {
  const TimetableSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SuggestionsBloc, SuggestionState>(
      builder: (BuildContext context, SuggestionState state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Autocomplete<String>(
            optionsBuilder: (TextEditingValue textEditingValue) {
              if (textEditingValue.text.isEmpty) {
                return const Iterable<String>.empty();
              }

              context.read<SuggestionsBloc>().add(
                SuggestionEvent.loadSuggestions(textEditingValue.text),
              );

              return state.maybeWhen(
                success: (suggestions) => suggestions.where(
                  (item) => item.toLowerCase().contains(
                    textEditingValue.text.toLowerCase(),
                  ),
                ),
                orElse: () => const Iterable<String>.empty(),
              );
            },

            onSelected: (String selection) {
              context.read<TimetableBloc>().add(
                TimetableEvent.loadDataForTarget(selection),
              );
            },

            fieldViewBuilder:
                (context, textEditingController, focusNode, onFieldSubmitted) {
                  return TextField(
                    controller: textEditingController,
                    focusNode: focusNode,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'Поиск предмета...',
                      fillColor: Theme.of(context).brightness == Brightness.light
                          ? Colors.orange.withValues(alpha: .1)
                          : Colors.grey.withValues(alpha: .2),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                          width: 1.0,
                        ),
                      ),
                    ),
                    onSubmitted: (value) => onFieldSubmitted(),
                  );
                },

            optionsViewBuilder: (context, onSelected, options) {
              return BlocBuilder<SuggestionsBloc, SuggestionState>(
                builder: (BuildContext context, SuggestionState state) {
                  return Align(
                    alignment: Alignment.topLeft,
                    child: Material(
                      elevation: 0,
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxHeight: 220),
                        child: state.maybeWhen(
                          loading: () =>
                              const Center(child: CircularProgressIndicator()),
                          success: (_) => ListView.builder(
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
                          error: (message) =>
                              Center(child: Text('Ошибка: $message')),
                          orElse: () => const SizedBox(),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
