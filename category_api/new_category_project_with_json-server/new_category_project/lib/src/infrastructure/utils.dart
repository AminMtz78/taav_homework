import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utils {
  static String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'this field can not be empty';
    }
    return null;
  }

  static SnackbarController mySnackBar(
      {required String error, required String message}) {
    return Get.snackbar(
      duration: const Duration(seconds: 5),
      error,
      message,
      backgroundColor: Colors.orange.shade200,

    );
  }

  static Widget verticalSpacer(
    double? height,
  ) {
    return SizedBox(
      height: height ?? 0,
    );
  }
}
