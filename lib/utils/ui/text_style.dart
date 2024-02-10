import 'package:flutter/material.dart';
import 'colors.dart';
import 'dimens.dart';

class AppTextStyles {
  static TextStyle textStyle = const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w700,
    fontSize: Dimens.textSize,
  );
  static TextStyle titleTextStyle = const TextStyle(
    color: AppColors.textColor,
    fontWeight: FontWeight.w700,
    fontSize: Dimens.titleTextSize,
  );
  static TextStyle buttonItemTextStyle = const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w500,
    fontSize: Dimens.buttonItemTextStyle,
  );
}