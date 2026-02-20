import 'package:flutter/material.dart';
import 'package:sfu/src/core/utils/loading_indicator/loading_indicator.dart';

class StandardLoadingIndicator implements LoadingIndicator  {
  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator.adaptive());
  }
}
