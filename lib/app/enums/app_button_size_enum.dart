import 'package:app_commons_design_system/app/styles/app_font_weight.dart';
import 'package:flutter/widgets.dart';

import '../styles/app_text_styles.dart';

enum AppButtonSizeEnum {
  small,
  large,
}

extension AppButtonSizeEnumExt on AppButtonSizeEnum {
  Size get size {
    switch (this) {
      case AppButtonSizeEnum.small:
        return const Size(double.maxFinite, 48);
      case AppButtonSizeEnum.large:
        return const Size(double.maxFinite, 56);
      default:
        return const Size(double.maxFinite, 56);
    }
  }

  TextStyle? get textStyle {
    switch (this) {
      case AppButtonSizeEnum.small:
        return AppTextStyles.bodyXs.copyWith(
          fontWeight: AppFontWeight.semibold,
        );
      case AppButtonSizeEnum.large:
        return AppTextStyles.button.copyWith(
          fontWeight: AppFontWeight.semibold,
        );
      default:
        return null;
    }
  }
}
