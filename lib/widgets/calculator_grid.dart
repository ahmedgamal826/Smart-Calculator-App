import 'package:calculator_app_task1/widgets/calculator_buttons.dart';
import 'package:flutter/material.dart';

class CalculatorGrid extends StatefulWidget {
  CalculatorGrid({
    super.key,
    required this.buttonPressed,
    required this.onLongPress,
    required this.isLongPressEnabled,
  });

  final Function(String) buttonPressed;
  final Function(String) onLongPress;
  final bool isLongPressEnabled;

  @override
  State<CalculatorGrid> createState() => _CalculatorGridState();
}

class _CalculatorGridState extends State<CalculatorGrid> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (var i = 0; i < 5; i++)
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: ([
                    ['AC', '⌫', '%', '÷'],
                    ['7', '8', '9', 'X'],
                    ['4', '5', '6', '-'],
                    ['1', '2', '3', '+'],
                    ['0', '.', '=']
                  ][i])
                      .map((btnText) {
                    if (btnText == '=') {
                      return Expanded(
                        flex: 2, // يأخذ عرض زرارين
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: AspectRatio(
                            aspectRatio: 2, // نسبة العرض للارتفاع مضاعفة
                            child: CalculatorButtons(
                              btnText: btnText,
                              txtColor: Colors.white,
                              btnColor: Colors.deepOrangeAccent[100]!,
                              onPressed: widget.buttonPressed,
                              onLongPress: widget.isLongPressEnabled
                                  ? widget.onLongPress
                                  : (btnText) {},
                            ),
                          ),
                        ),
                      );
                    }

                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: AspectRatio(
                          aspectRatio: 1, // نسبة العرض إلى الارتفاع 1:1
                          child: CalculatorButtons(
                            btnText: btnText,
                            txtColor: Colors.white,
                            btnColor: btnText == 'AC' ||
                                    btnText == '⌫' ||
                                    btnText == '%' ||
                                    btnText == '÷' ||
                                    btnText == 'X' ||
                                    btnText == '-' ||
                                    btnText == '+'
                                ? Colors.deepOrangeAccent[100]!
                                : Colors.grey[850]!,
                            onPressed: widget.buttonPressed,
                            onLongPress: widget.isLongPressEnabled
                                ? widget.onLongPress
                                : (btnText) {},
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
