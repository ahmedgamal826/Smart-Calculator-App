import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class EquationWidget extends StatelessWidget {
  const EquationWidget({
    super.key,
    required this.isDarkMode,
    required this.equation,
  });

  final bool isDarkMode;
  final String equation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: isDarkMode ? Colors.white : Colors.grey[900],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 28),
        alignment: Alignment.centerLeft,
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.20,
        child: AutoSizeText(
          equation,
          style: TextStyle(
            color: isDarkMode ? Colors.deepOrangeAccent[100] : Colors.white,
            fontSize: 38,
          ),
          maxLines: 2,
        ),
      ),
    );
  }
}
