import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sfu/src/app/dependency_injection/injection.dart' as di;
import 'package:sfu/src/core/localization/app_localizations.dart';
import 'package:sfu/src/core/widgets/loading_indicator_widget.dart';
import 'package:sfu/src/feature/news/domain/entity/news.dart';
import 'package:sfu/src/feature/news/presentation/bloc/news_bloc.dart';

part '../widgets/news_content.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di.sl<NewsBloc>()..add(NewsEvent.loadData()),
      child: Scaffold(
        body: _NewsContent(),
      ),
    );
  }
}
