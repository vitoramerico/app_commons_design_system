import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  //Primary Brand Color
  static const Color primaryDark = Color(0xFFD83731);
  static const Color primaryMedium = Color(0xFFF8524B);
  static const Color primaryLight = Color(0xFFFF9490);

  static const Color secondaryDark = Color(0xFF0D0050);
  static const Color secondaryMedium = Color(0xFF22267E);
  static const Color secondaryLight = Color(0xFF3A45A6);

  static const Color tertiaryDark = Color(0xFFE4764F);
  static const Color tertiaryMedium = Color(0xFFFB9774);
  static const Color tertiaryLight = Color(0xFFFFB59B);

  static const Color quaternaryDark = Color(0xFFAA1C4F);
  static const Color quaternaryMedium = Color(0xFFED3957);
  static const Color quaternaryLight = Color(0xFFF98A87);

  //Neutral Colors
  static const Color neutralDarkest = Color(0xFF333333);
  static const Color neutralDark = Color(0xFF666666);
  static const Color neutralMedium = Color(0xFF999999);
  static const Color neutralLightMedium = Color(0xFFCCCCCC);
  static const Color neutralLight = Color(0xFFF6F6F6);
  static const Color neutralLightest = Color(0xFFFFFFFF);

  //Support Colors
  static const Color supportSuccessDark = Color(0xFF22A97B);
  static const Color supportSuccessMedium = Color(0xFF32C995);
  static const Color supportSuccessLight = Color(0xFF78E3BF);
  static const Color supportWarningDark = Color(0xFFE39A35);
  static const Color supportWarningMedium = Color(0xFFFFB146);
  static const Color supportWarningLight = Color(0xFFFFCA81);
  static const Color supportDangerDark = Color(0xFFA0001D);
  static const Color supportDangerMedium = Color(0xFFBF0000);
  static const Color supportDangerLight = Color(0xFFE51D41);
  static const Color supportReportDark = Color(0xFF216ECB);
  static const Color supportReportMedium = Color(0xFF2D83EA);
  static const Color supportReportLight = Color(0xFF579FF5);

  //Gradients
  static const LinearGradient gradientPrimary = LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    colors: [primaryMedium, quaternaryMedium],
  );

  static const LinearGradient gradientSecondary = LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    colors: [secondaryDark, secondaryLight],
  );

  static const LinearGradient gradientTertiary = LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    colors: [primaryMedium, tertiaryMedium],
  );

  //CreateMaterialColor
  static MaterialColor createMaterialColor(Color color) {
    final hslColor = HSLColor.fromColor(color);
    final lightness = hslColor.lightness;

    /// if [500] is the default color, there are at LEAST five
    /// steps below [500]. (i.e. 400, 300, 200, 100, 50.) A
    /// divisor of 5 would mean [50] is a lightness of 1.0 or
    /// a color of #ffffff. A value of six would be near white
    /// but not quite.
    const lowDivisor = 6;

    /// if [500] is the default color, there are at LEAST four
    /// steps above [500]. A divisor of 4 would mean [900] is
    /// a lightness of 0.0 or color of #000000
    const highDivisor = 5;

    final lowStep = (1.0 - lightness) / lowDivisor;
    final highStep = lightness / highDivisor;

    var swatch = {
      50: (hslColor.withLightness(lightness + (lowStep * 5))).toColor(),
      100: (hslColor.withLightness(lightness + (lowStep * 4))).toColor(),
      200: (hslColor.withLightness(lightness + (lowStep * 3))).toColor(),
      300: (hslColor.withLightness(lightness + (lowStep * 2))).toColor(),
      400: (hslColor.withLightness(lightness + lowStep)).toColor(),
      500: (hslColor.withLightness(lightness)).toColor(),
      600: (hslColor.withLightness(lightness - highStep)).toColor(),
      700: (hslColor.withLightness(lightness - (highStep * 2))).toColor(),
      800: (hslColor.withLightness(lightness - (highStep * 3))).toColor(),
      900: (hslColor.withLightness(lightness - (highStep * 4))).toColor(),
    };

    return MaterialColor(color.value, swatch);
  }
}
