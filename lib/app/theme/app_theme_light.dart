import 'package:flutter/material.dart';

import 'app_colors.dart';

final _appThemeLightBase = ThemeData(
  brightness: Brightness.light,
  primarySwatch: AppColors.createMaterialColor(AppColors.primaryDark),
  backgroundColor: AppColors.neutralLightest,
  scaffoldBackgroundColor: AppColors.neutralLightest,
  primaryIconTheme: const IconThemeData(color: AppColors.primaryLight),
);

final appThemeLight = _appThemeLightBase.copyWith(
  colorScheme: _appThemeLightBase.colorScheme.copyWith(
    secondary: AppColors.primaryLight,
  ),
  secondaryHeaderColor: AppColors.secondaryDark,
);
