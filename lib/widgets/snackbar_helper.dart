import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackbarHelper {
  static error({
    required String message,
    String? title,
    double? width,
    SnackPosition? snackPosition,
    EdgeInsets? margin,
  }) {
    Get.rawSnackbar(
      title: title,
      message: message,
      maxWidth: width,
      snackStyle: SnackStyle.FLOATING,
      snackPosition: snackPosition ?? SnackPosition.BOTTOM,
      margin: margin ?? const EdgeInsets.all(16.0),
      borderRadius: 12.0,
      icon: const Icon(Icons.error, color: Colors.white),
      isDismissible: true,
      backgroundColor: Get.theme.colorScheme.error,
    );
  }

  static errorSnackBarTopRight({required String message, String? title}) {
    error(
      title: title,
      message: message,
      width: Get.width * .5,
      snackPosition: SnackPosition.TOP,
      margin: EdgeInsets.only(top: 25, left: Get.width * .58),
    );
  }

  static errorSnackBarTopCenter({required String message, String? title}) {
    error(
      title: title,
      message: message,
      width: Get.width * .5,
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.only(top: 25),
    );
  }
}
