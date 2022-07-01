import 'dart:ui';

import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

enum AppTagTypeEnum {
  enabled,
  success,
  warning,
  error,
  info,
}

extension AppTagTypeEnumExt on AppTagTypeEnum {
  Color get backgroundColor {
    switch (this) {
      case AppTagTypeEnum.enabled:
        return AppColors.neutralLightest;
      case AppTagTypeEnum.success:
        return AppColors.supportSuccessLight;
      case AppTagTypeEnum.warning:
        return AppColors.supportWarningLight;
      case AppTagTypeEnum.error:
        return AppColors.supportDangerDark;
      case AppTagTypeEnum.info:
        return AppColors.supportReportMedium.withOpacity(0.32);
      default:
        return AppColors.neutralLightest;
    }
  }

  Color get borderColor {
    switch (this) {
      case AppTagTypeEnum.enabled:
        return AppColors.neutralMedium;
      case AppTagTypeEnum.success:
        return AppColors.supportSuccessMedium;
      case AppTagTypeEnum.warning:
        return AppColors.supportWarningDark;
      case AppTagTypeEnum.error:
        return AppColors.supportDangerMedium;
      case AppTagTypeEnum.info:
        return AppColors.supportReportMedium;
      default:
        return AppColors.neutralMedium;
    }
  }

  Color get textColor {
    switch (this) {
      case AppTagTypeEnum.error:
        return AppColors.neutralLightest;
      default:
        return AppColors.neutralDarkest;
    }
  }
}
