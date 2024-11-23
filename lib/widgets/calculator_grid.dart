import 'package:calculator_app_task1/widgets/calculator_buttons.dart';
import 'package:flutter/material.dart';

class CalculatorGrid extends StatefulWidget {
  CalculatorGrid({super.key, required this.buttonPressed});

  final Function(String) buttonPressed;

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CalculatorButtons(
                  btnText: 'AC',
                  txtColor: Colors.white,
                  onPressed: widget.buttonPressed,
                  btnColor: Colors.deepOrangeAccent[100]!,
                ),
                CalculatorButtons(
                  btnText: '⌫',
                  txtColor: Colors.white,
                  onPressed: widget.buttonPressed,
                  btnColor: Colors.deepOrangeAccent[100]!,
                ),
                CalculatorButtons(
                  btnText: '%',
                  txtColor: Colors.white,
                  onPressed: widget.buttonPressed,
                  btnColor: Colors.deepOrangeAccent[100]!,
                ),
                CalculatorButtons(
                  btnText: '÷',
                  txtColor: Colors.white,
                  onPressed: widget.buttonPressed,
                  btnColor: Colors.deepOrangeAccent[100]!,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CalculatorButtons(
                  btnText: '7',
                  txtColor: Colors.white,
                  onPressed: widget.buttonPressed,
                  btnColor: Colors.grey[850]!,
                ),
                CalculatorButtons(
                  btnText: '8',
                  txtColor: Colors.white,
                  onPressed: widget.buttonPressed,
                  btnColor: Colors.grey[850]!,
                ),
                CalculatorButtons(
                  btnText: '9',
                  txtColor: Colors.white,
                  onPressed: widget.buttonPressed,
                  btnColor: Colors.grey[850]!,
                ),
                CalculatorButtons(
                  btnText: 'X',
                  txtColor: Colors.white,
                  onPressed: widget.buttonPressed,
                  btnColor: Colors.deepOrangeAccent[100]!,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CalculatorButtons(
                  btnText: '4',
                  txtColor: Colors.white,
                  onPressed: widget.buttonPressed,
                  btnColor: Colors.grey[850]!,
                ),
                CalculatorButtons(
                  btnText: '5',
                  txtColor: Colors.white,
                  onPressed: widget.buttonPressed,
                  btnColor: Colors.grey[850]!,
                ),
                CalculatorButtons(
                  btnText: '6',
                  txtColor: Colors.white,
                  onPressed: widget.buttonPressed,
                  btnColor: Colors.grey[850]!,
                ),
                CalculatorButtons(
                  btnText: '-',
                  txtColor: Colors.white,
                  onPressed: widget.buttonPressed,
                  btnColor: Colors.deepOrangeAccent[100]!,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CalculatorButtons(
                  btnText: '1',
                  txtColor: Colors.white,
                  onPressed: widget.buttonPressed,
                  btnColor: Colors.grey[850]!,
                ),
                CalculatorButtons(
                  btnText: '2',
                  txtColor: Colors.white,
                  onPressed: widget.buttonPressed,
                  btnColor: Colors.grey[850]!,
                ),
                CalculatorButtons(
                  btnText: '3',
                  txtColor: Colors.white,
                  onPressed: widget.buttonPressed,
                  btnColor: Colors.grey[850]!,
                ),
                CalculatorButtons(
                  btnText: '+',
                  txtColor: Colors.white,
                  onPressed: widget.buttonPressed,
                  btnColor: Colors.deepOrangeAccent[100]!,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CalculatorButtons(
                  btnText: '0',
                  txtColor: Colors.white,
                  onPressed: widget.buttonPressed,
                  btnColor: Colors.grey[850]!,
                ),
                CalculatorButtons(
                  btnText: '.',
                  txtColor: Colors.white,
                  onPressed: widget.buttonPressed,
                  btnColor: Colors.grey[850]!,
                ),
                CalculatorButtons(
                  btnText: '=',
                  txtColor: Colors.white,
                  onPressed: widget.buttonPressed,
                  btnColor: Colors.deepOrangeAccent[100]!,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
