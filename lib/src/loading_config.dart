import 'package:flutter/material.dart';
import 'package:ss_placeholder_view/src/values/strings.dart';

import '../ssplaceholderview.dart';

class LoadingConfig {
  final String title;
  final String subtitle;
  final LoaderName widgetName;
  final Widget? widget;
  final Color? color;
  final double size;
  final bool isLoadingOnTop;

  LoadingConfig({
    this.title = AppStrings.holdOn,
    this.subtitle = AppStrings.defaultLoadingSubtitle,
    this.widgetName = LoaderName.threeBounce,
    this.widget,
    this.color,
    this.size = 32,
    this.isLoadingOnTop = false,
  });
}
