import 'package:flutter/material.dart';
import 'package:ss_placeholder_view/src/spin_kit_loader.dart';
import 'package:ss_placeholder_view/src/ss_placeholder_refresh_button.dart';
import 'package:ss_placeholder_view/src/values/strings.dart';
import 'package:ss_placeholder_view/src/vector_asset.dart';

import '../ssplaceholderview.dart';

class SSPlaceholder extends StatelessWidget {
  final PlaceHolderState? state;
  final PlaceHolderImageConfig? placeHolderImageConfig;
  final VoidCallback? onButtonClick;
  final LoadingConfig? loadingConfig;
  final ButtonConfig? buttonConfig;
  final TextStyle? titleTextStyle;
  final TextStyle? subTitleTextStyle;
  final ErrorConfig? errorConfig;
  final Widget child;
  final bool showPlaceHolder;

  const SSPlaceholder({
    Key? key,
    @required this.state,
    this.onButtonClick,
    this.placeHolderImageConfig,
    this.loadingConfig,
    this.buttonConfig,
    this.titleTextStyle,
    this.subTitleTextStyle,
    this.errorConfig,
    required this.child,
    required this.showPlaceHolder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? title;
    String? subtitle;

    switch (state) {
      case PlaceHolderState.loading:
        {
          title = loadingConfig?.title;
          subtitle = loadingConfig?.subtitle;
        }
        break;

      case PlaceHolderState.success:
        {
          title = errorConfig?.emptyTitle;
          subtitle = errorConfig?.emptySubtitle;
        }
        break;

      case PlaceHolderState.error:
        {
          title = errorConfig?.errorTitle;
          subtitle = errorConfig?.errorSubtitle;
        }
        break;

      // PlaceHolderState.idle
      default:
        {
          title = '';
          subtitle = '';
        }
        break;
    }
    return showPlaceHolder
        ? SizedBox.expand(
            child: Container(
              padding: const EdgeInsets.all(40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if ((placeHolderImageConfig?.image?.isNotEmpty ?? false) ||
                      (placeHolderImageConfig?.widget != null))
                    Flexible(
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Container(
                          padding: placeHolderImageConfig?.extraPadding,
                          child: VectorAsset(
                            image:
                                Theme.of(context).brightness == Brightness.dark
                                    ? placeHolderImageConfig
                                            ?.darkPlaceholderImage ??
                                        placeHolderImageConfig?.image
                                    : placeHolderImageConfig?.image,
                            customPlaceHolder: placeHolderImageConfig?.widget,
                            animationName:
                                placeHolderImageConfig?.animationName,
                            fit: BoxFit.contain,
                            width: 10,
                            height: 10,
                          ),
                        ),
                      ),
                    ),
                  loadingConfig!.isLoadingOnTop
                      ? _changeLoaderPositionToTop(title, subtitle)
                      : _changeLoaderPosition(title, subtitle),
                ],
              ),
            ),
          )
        : child;
  }

  Widget _changeLoaderPosition(String? title, String? subtitle) {
    return Column(
      children: [
        if (title != null)
          Text(
            title,
            textAlign: TextAlign.center,
            style: titleTextStyle ??
                const TextStyle(
                  fontSize: 20,
                  letterSpacing: 0.4,
                  fontWeight: FontWeight.bold,
                ),
          ),
        if (title != null && subtitle != null) const SizedBox(height: 5),
        if (subtitle != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              subtitle,
              textAlign: TextAlign.center,
              style: subTitleTextStyle ??
                  const TextStyle(
                    fontSize: 14,
                    letterSpacing: 0.4,
                  ),
            ),
          ),
        const SizedBox(height: 20),
        Visibility(
          visible:
              state != PlaceHolderState.loading && !buttonConfig!.hideButton,
          child: SSPlaceholderRefreshButton(
            onTap: onButtonClick ?? () {},
            height: buttonConfig?.buttonHeight,
            width: buttonConfig?.buttonWidth ?? 120,
            color: buttonConfig?.buttonColor,
            buttonTextStyle: buttonConfig?.buttonTextStyle,
            title: buttonConfig?.buttonText ??
                (state == PlaceHolderState.success
                    ? AppStrings.refresh
                    : AppStrings.retry),
          ),
        ),
        Visibility(
          visible: state == PlaceHolderState.loading,
          child: Container(
            alignment: Alignment.center,
            height: 56,
            child: (loadingConfig?.widget != null)
                ? loadingConfig?.widget
                : SpinKitLoader(
                    loaderName: loadingConfig?.widgetName,
                    color: loadingConfig?.color,
                    size: loadingConfig?.size,
                  ),
          ),
        ),
      ],
    );
  }

  Widget _changeLoaderPositionToTop(String? title, String? subtitle) {
    return Column(
      children: [
        Visibility(
          visible: state == PlaceHolderState.loading,
          child: Container(
            alignment: Alignment.center,
            height: 56,
            child: (loadingConfig?.widget != null)
                ? loadingConfig?.widget
                : SpinKitLoader(
                    loaderName: loadingConfig?.widgetName,
                    color: loadingConfig?.color,
                    size: loadingConfig?.size,
                  ),
          ),
        ),
        const SizedBox(height: 20),
        if (title != null)
          Text(
            title,
            textAlign: TextAlign.center,
            style: titleTextStyle ??
                const TextStyle(
                  fontSize: 20,
                  letterSpacing: 0.4,
                  fontWeight: FontWeight.bold,
                ),
          ),
        if (title != null && subtitle != null) const SizedBox(height: 5),
        if (subtitle != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              subtitle,
              textAlign: TextAlign.center,
              style: subTitleTextStyle ??
                  const TextStyle(
                    fontSize: 14,
                    letterSpacing: 0.4,
                  ),
            ),
          ),
        const SizedBox(height: 24),
        Visibility(
          visible:
              state != PlaceHolderState.loading && !buttonConfig!.hideButton,
          child: SSPlaceholderRefreshButton(
            onTap: onButtonClick ?? () {},
            height: buttonConfig?.buttonHeight,
            width: buttonConfig?.buttonWidth ?? 120,
            color: buttonConfig?.buttonColor,
            buttonTextStyle: buttonConfig?.buttonTextStyle,
            title: buttonConfig?.buttonText ??
                (state == PlaceHolderState.success
                    ? AppStrings.refresh
                    : AppStrings.retry),
          ),
        ),
      ],
    );
  }
}
