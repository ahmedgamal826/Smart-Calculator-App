import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:calculator_app_task1/features/history/presentation/views/widgets/custom_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void showCardDialog(BuildContext context, String content) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.noHeader,
    animType: AnimType.bottomSlide,
    body: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          content,
          style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        ElevatedButton.icon(
          onPressed: () {
            Clipboard.setData(ClipboardData(text: content));
            Navigator.of(context).pop();

            CustomSnackBar.show(
              context,
              title: 'Copied',
              message: 'Text copied to clipboard!',
              contentType: ContentType.success,
            );
          },
          icon: const Icon(Icons.copy, color: Colors.white),
          label: const Text("Copy", style: TextStyle(color: Colors.white)),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepOrangeAccent[100],
          ),
        ),
      ],
    ),
  ).show();
}
