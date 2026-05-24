import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sfu/src/core/theme/app_theme.dart';
import 'package:sfu/src/feature/timetable/presentation/bloc/timetable_bloc.dart';
import 'package:sfu/src/feature/timetable/suggestion/presentation/bloc/suggestions_bloc.dart';

class TimetableSearchBar extends StatelessWidget {
  const TimetableSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt = Theme.of(context).textTheme;

    return BlocBuilder<SuggestionsBloc, SuggestionState>(
      builder: (context, state) {
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
              // TODO: Сделать поиск по преподавателям и группам
            },

            fieldViewBuilder:
                (context, controller, focusNode, onFieldSubmitted) {
                  return TextField(
                    controller: controller,
                    focusNode: focusNode,
                    onSubmitted: (_) => onFieldSubmitted(),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: ext.textTertiary,
                        size: 20,
                      ),
                      hintText: 'Поиск группы или преподавателя',
                      hintStyle: tt.bodyMedium?.copyWith(
                        color: ext.textTertiary,
                      ),
                    ),
                  );
                },

            optionsViewBuilder: (context, onSelected, options) {
              return BlocBuilder<SuggestionsBloc, SuggestionState>(
                builder: (context, state) {
                  return Align(
                    alignment: Alignment.topLeft,
                    child: Material(
                      elevation: 0,
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(AppTheme.radiusLg),
                      child: Container(
                        constraints: const BoxConstraints(maxHeight: 220),
                        decoration: BoxDecoration(
                          border: Border.all(color: ext.border),
                          borderRadius: BorderRadius.circular(
                            AppTheme.radiusLg,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                            AppTheme.radiusLg,
                          ),
                          child: state.maybeWhen(
                            loading: () => const SizedBox(
                              height: 56,
                              child: Center(child: CircularProgressIndicator()),
                            ),
                            success: (_) => ListView.separated(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              itemCount: options.length,
                              separatorBuilder: (_, __) =>
                                  Divider(height: 1, color: ext.divider),
                              itemBuilder: (context, index) {
                                final item = options.elementAt(index);
                                return ListTile(
                                  dense: true,
                                  leading: Icon(
                                    Icons.search,
                                    size: 16,
                                    color: ext.textTertiary,
                                  ),
                                  title: Text(item, style: tt.labelLarge),
                                  onTap: () => onSelected(item),
                                );
                              },
                            ),
                            error: (_) => const SizedBox(),
                            orElse: () => const SizedBox(),
                          ),
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
