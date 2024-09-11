import 'package:ai_assistant/widget/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDialog {
  /// info
  static void info(String msg) {
    Get.snackbar('info', msg,
        colorText: Colors.white,
        backgroundColor: Colors.deepPurple.withOpacity(.7));
  }

  /// success
  static void success(String msg) {
    Get.snackbar('info', msg,
        colorText: Colors.white, backgroundColor: Colors.green.withOpacity(.7));
  }

  /// error
  static void error(String msg) {
    Get.snackbar('info', msg,
        colorText: Colors.white,
        backgroundColor: Colors.redAccent.withOpacity(.7));
  }

  /// loading dialog
  static void showLoadingDialog() {
    Get.dialog(const Center(child: CustomLoading()));
  }
}
