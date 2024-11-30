import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

class CustomSnackBar {
  static void show(
    BuildContext context, {
    required String title,
    required String message,
    required ContentType contentType,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: AwesomeSnackbarContent(
          title: title,
          message: message,
          contentType: contentType,
        ),
        backgroundColor: Colors.transparent,
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
