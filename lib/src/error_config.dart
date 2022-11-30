import 'package:ss_placeholder_view/src/values/strings.dart';

class ErrorConfig {
  final String? errorTitle;
  final String? errorSubtitle;
  final String? emptyTitle;
  final String? emptySubtitle;

  ErrorConfig({
    this.errorTitle = AppStrings.oops,
    this.errorSubtitle = AppStrings.somethingWentWrong,
    this.emptyTitle = AppStrings.unavailable,
    this.emptySubtitle = AppStrings.dataUnavailable,
  });
}
