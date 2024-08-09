import 'package:flutter/material.dart';
import 'package:google_place_autocomplete/style/colors.style.dart';
import 'package:google_place_autocomplete/style/theme.dart';

abstract class IFormFieldStyle {
  static InputDecoration defaultInputDecoration(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    BorderRadius borderRadius =
        const BorderRadius.all(Radius.circular(AppTheme.inputRadius));
    Color fillColor = isDarkMode ? AppColors.blueGrey4 : AppColors.white;
    Color borderColor = isDarkMode ? AppColors.blueGrey3 : AppColors.grey7;

    return InputDecoration(
      filled: true,
      fillColor: fillColor,
      enabledBorder: OutlineInputBorder(
        borderSide:
            BorderSide(width: AppTheme.inputBorderWidth, color: borderColor),
        borderRadius: borderRadius,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
            width: AppTheme.inputBorderWidth, color: AppColors.primary),
        borderRadius: borderRadius,
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
            width: AppTheme.inputBorderWidth,
            color: Theme.of(context).colorScheme.error),
        borderRadius: borderRadius,
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
            width: AppTheme.inputBorderWidth,
            color: Theme.of(context).colorScheme.error),
        borderRadius: borderRadius,
      ),
    );
  }

  static OutlineInputBorder outlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: AppColors.white),
    );
  }

  static final otpInputDecoration = InputDecoration(
    contentPadding: const EdgeInsets.symmetric(vertical: 15),
    border: outlineInputBorder(),
    focusedBorder: outlineInputBorder(),
    enabledBorder: outlineInputBorder(),
  );
}
