import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ss_placeholder_view/src/values/strings.dart';

/// This widget allows to use svg vectors when running on web
class VectorAsset extends StatelessWidget {
  final String? image;
  final Widget? customPlaceHolder;
  final String? dark;
  final String? animationName;
  final Color? color;
  final BlendMode? colorBlendMode;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Alignment alignment;

  const VectorAsset({
    Key? key,
    this.image,
    this.customPlaceHolder,
    this.dark,
    this.animationName,
    this.color,
    this.colorBlendMode,
    this.width,
    this.height,
    this.fit,
    this.alignment = Alignment.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (customPlaceHolder != null)
        ? customPlaceHolder!
        : (image != null)
            ? kIsWeb
                ? Image.network(
                    AppStrings.assets +
                        (Theme.of(context).brightness == Brightness.dark
                            ? dark ?? image!
                            : image!),
                    color: color,
                    colorBlendMode: colorBlendMode,
                    width: width,
                    height: height,
                    fit: fit,
                    alignment: alignment,
                  )
                : (image!.contains('.svg'))
                    ? SvgPicture.asset(
                        Theme.of(context).brightness == Brightness.dark
                            ? dark ?? image!
                            : image!,
                        color: color,
                        colorBlendMode: colorBlendMode ?? BlendMode.srcIn,
                        width: width,
                        height: height,
                        fit: fit ?? BoxFit.contain,
                        alignment: alignment,
                      )
                    : Image.asset(
                        image!,
                        width: width,
                        height: height,
                        fit: fit ?? BoxFit.contain,
                        alignment: alignment,
                      )
            : const SizedBox.shrink();
  }
}
