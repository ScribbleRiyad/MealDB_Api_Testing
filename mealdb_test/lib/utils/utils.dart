import 'package:flutter/material.dart';
import 'package:mealdb_test/utils/theme_styles.dart';

import '../widgets/custom_text_widget.dart';


class Utils {
  static void customSnackBar(
      {required context,
      required String snackText,
      SnackBarBehavior? snackBehavior,
      SnackBarAction? snackBarAction,
      double? snackTextSize,
      Color? snackTextColor,
      int? snackDuration,
      Color? snackBackgroundColor}) {
    final snack = SnackBar(
      backgroundColor: snackBackgroundColor ?? ThemeStyles.blackColor,
      behavior: snackBehavior ?? SnackBarBehavior.fixed,
      elevation: 0,
      action: snackBarAction,
      content: CustomTextWidget(
          color: snackTextColor ?? ThemeStyles.whiteColor,
          fontSize: snackTextSize ?? 14,
          maxLines: 4,
          text: snackText),
      duration: Duration(seconds: snackDuration ?? 3),
    );
    ScaffoldMessenger.of(context).showSnackBar(snack);
  }
}
