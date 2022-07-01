import 'package:flutter/material.dart';

class AppAnimationCurves {
  AppAnimationCurves._();

  ///Duration
  static const Duration easeOutDuration = Duration(milliseconds: 400);

  static const Duration easeInOutDuration = Duration(milliseconds: 560);

  ///Curves
  static const Curve easeOut = Curves.easeOut;

  static const Curve easeInOut = Curves.easeInOut;
}
