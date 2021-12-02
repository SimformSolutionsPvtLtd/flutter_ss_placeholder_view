import 'package:flutter/material.dart';

class PlaceHolderImageConfig {
  final String? image;
  final Widget? widget;
  final String? darkPlaceholderImage;
  final EdgeInsets extraPadding;
  final String? animationName;

  PlaceHolderImageConfig({
    this.image,
    this.widget,
    this.darkPlaceholderImage,
    this.extraPadding = const EdgeInsets.all(0),
    this.animationName,
  });
}
