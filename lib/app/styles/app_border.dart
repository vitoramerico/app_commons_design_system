import 'package:flutter/material.dart';

class AppBorder {
  AppBorder._();

  static Border widthNone() => const Border();

  static Border widthHairline({Color color = const Color(0xFF000000)}) =>
      Border.all(
        color: color,
        style: BorderStyle.solid,
        width: 1,
      );

  static Border widthThin({Color color = const Color(0xFF000000)}) =>
      Border.all(
        color: color,
        style: BorderStyle.solid,
        width: 2,
      );

  static Border widthThick({Color color = const Color(0xFF000000)}) =>
      Border.all(
        color: color,
        style: BorderStyle.solid,
        width: 4,
      );
}
