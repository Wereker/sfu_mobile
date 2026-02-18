import 'package:flutter/material.dart';
import 'package:sfu/src/core/dependency_injection/injection.dart' as di;
import 'package:sfu/src/core/utils/loading_indicator/loading_indicator.dart';

class LoadingIndicatorWidget extends StatelessWidget {
  const LoadingIndicatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final indicator = di.sl<LoadingIndicator>();
    return indicator.build(context);
  }

}