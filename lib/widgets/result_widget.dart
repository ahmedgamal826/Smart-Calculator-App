import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ResultWidget extends StatelessWidget {
  const ResultWidget({
    super.key,
    required this.isDarkMode,
    required this.result,
  });

  final bool isDarkMode;
  final String result;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      alignment: Alignment.centerRight,
      width: double.infinity,
      color: isDarkMode ? Colors.black : Colors.white,
      child: AutoSizeText(
        result,
        style: TextStyle(
          color: isDarkMode ? Colors.deepOrangeAccent[100] : Colors.black,
          fontSize: 38,
        ),
        maxLines: 1,
      ),
    );
  }
}
