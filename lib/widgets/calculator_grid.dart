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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CalculatorButtons(
                  onLongPress: widget.isLongPressEnabled
                      ? widget.onLongPress
                      : widget.buttonPressed, // فقط إذا كان الضغط المطول مفعل

                  btnText: 'AC',
                  txtColor: Colors.white,
                  onPressed: widget.buttonPressed,
                  btnColor: Colors.deepOrangeAccent[100]!,
                ),
                CalculatorButtons(
                  onLongPress: widget.isLongPressEnabled
                      ? widget.onLongPress
                      : (btnText) {}, // فقط إذا كان الضغط المطول مفعل

                  btnText: '⌫',
                  txtColor: Colors.white,
                  onPressed: widget.buttonPressed,
                  btnColor: Colors.deepOrangeAccent[100]!,
                ),
                CalculatorButtons(
                  onLongPress: widget.isLongPressEnabled
                      ? widget.onLongPress
                      : (btnText) {}, // فقط إذا كان الضغط المطول مفعل

                  btnText: '%',
                  txtColor: Colors.white,
                  onPressed: widget.buttonPressed,
                  btnColor: Colors.deepOrangeAccent[100]!,
                ),
                CalculatorButtons(
                  onLongPress: widget.isLongPressEnabled
                      ? widget.onLongPress
                      : (btnText) {}, // فقط إذا كان الضغط المطول مفعل

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
                  onLongPress: widget.isLongPressEnabled
                      ? widget.onLongPress
                      : (btnText) {}, // فقط إذا كان الضغط المطول مفعل

                  btnText: '7',
                  txtColor: Colors.white,
                  onPressed: widget.buttonPressed,
                  btnColor: Colors.grey[850]!,
                ),
                CalculatorButtons(
                  onLongPress: widget.isLongPressEnabled
                      ? widget.onLongPress
                      : (btnText) {}, // فقط إذا كان الضغط المطول مفعل

                  btnText: '8',
                  txtColor: Colors.white,
                  onPressed: widget.buttonPressed,
                  btnColor: Colors.grey[850]!,
                ),
                CalculatorButtons(
                  onLongPress: widget.isLongPressEnabled
                      ? widget.onLongPress
                      : (btnText) {}, // فقط إذا كان الضغط المطول مفعل

                  btnText: '9',
                  txtColor: Colors.white,
                  onPressed: widget.buttonPressed,
                  btnColor: Colors.grey[850]!,
                ),
                CalculatorButtons(
                  onLongPress: widget.isLongPressEnabled
                      ? widget.onLongPress
                      : (btnText) {}, // فقط إذا كان الضغط المطول مفعل

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
                  onLongPress: widget.isLongPressEnabled
                      ? widget.onLongPress
                      : (btnText) {}, // فقط إذا كان الضغط المطول مفعل

                  btnText: '4',
                  txtColor: Colors.white,
                  onPressed: widget.buttonPressed,
                  btnColor: Colors.grey[850]!,
                ),
                CalculatorButtons(
                  onLongPress: widget.isLongPressEnabled
                      ? widget.onLongPress
                      : (btnText) {}, // فقط إذا كان الضغط المطول مفعل

                  btnText: '5',
                  txtColor: Colors.white,
                  onPressed: widget.buttonPressed,
                  btnColor: Colors.grey[850]!,
                ),
                CalculatorButtons(
                  onLongPress: widget.isLongPressEnabled
                      ? widget.onLongPress
                      : (btnText) {}, // فقط إذا كان الضغط المطول مفعل

                  btnText: '6',
                  txtColor: Colors.white,
                  onPressed: widget.buttonPressed,
                  btnColor: Colors.grey[850]!,
                ),
                CalculatorButtons(
                  onLongPress: widget.isLongPressEnabled
                      ? widget.onLongPress
                      : (btnText) {}, // فقط إذا كان الضغط المطول مفعل

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
                  onLongPress: widget.isLongPressEnabled
                      ? widget.onLongPress
                      : (btnText) {}, // فقط إذا كان الضغط المطول مفعل

                  btnText: '1',
                  txtColor: Colors.white,
                  onPressed: widget.buttonPressed,
                  btnColor: Colors.grey[850]!,
                ),
                CalculatorButtons(
                  onLongPress: widget.isLongPressEnabled
                      ? widget.onLongPress
                      : (btnText) {}, // فقط إذا كان الضغط المطول مفعل

                  btnText: '2',
                  txtColor: Colors.white,
                  onPressed: widget.buttonPressed,
                  btnColor: Colors.grey[850]!,
                ),
                CalculatorButtons(
                  onLongPress: widget.isLongPressEnabled
                      ? widget.onLongPress
                      : (btnText) {}, // فقط إذا كان الضغط المطول مفعل

                  btnText: '3',
                  txtColor: Colors.white,
                  onPressed: widget.buttonPressed,
                  btnColor: Colors.grey[850]!,
                ),
                CalculatorButtons(
                  onLongPress: widget.isLongPressEnabled
                      ? widget.onLongPress
                      : (btnText) {}, // فقط إذا كان الضغط المطول مفعل

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
                  onLongPress: widget.isLongPressEnabled
                      ? widget.onLongPress
                      : (btnText) {}, // فقط إذا كان الضغط المطول مفعل

                  btnText: '0',
                  txtColor: Colors.white,
                  onPressed: widget.buttonPressed,
                  btnColor: Colors.grey[850]!,
                ),
                CalculatorButtons(
                  onLongPress: widget.isLongPressEnabled
                      ? widget.onLongPress
                      : widget.buttonPressed, // فقط إذا كان الضغط المطول مفعل

                  btnText: '.',
                  txtColor: Colors.white,
                  onPressed: widget.buttonPressed,
                  btnColor: Colors.grey[850]!,
                ),
                CalculatorButtons(
                  onLongPress: widget.isLongPressEnabled
                      ? widget.onLongPress
                      : (btnText) {}, // فقط إذا كان الضغط المطول مفعل

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

// import 'package:flutter/material.dart';
// import 'calculator_buttons.dart';

// class CalculatorGrid extends StatefulWidget {
//   CalculatorGrid(
//       {super.key, required this.buttonPressed, required this.onLongPress});

//   final Function(String) buttonPressed;
//   final Function(String) onLongPress; // خاصية جديدة للتعامل مع الضغط المطول

//   @override
//   State<CalculatorGrid> createState() => _CalculatorGridState();
// }

// class _CalculatorGridState extends State<CalculatorGrid> {
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 10),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 CalculatorButtons(
//                   btnText: 'AC',
//                   txtColor: Colors.white,
//                   onPressed: widget.buttonPressed,
//                   onLongPress: widget.onLongPress, // تمرير الضغط المطول
//                   btnColor: Colors.deepOrangeAccent[100]!,
//                 ),
//                 CalculatorButtons(
//                   btnText: '⌫',
//                   txtColor: Colors.white,
//                   onPressed: widget.buttonPressed,
//                   onLongPress: widget.onLongPress, // تمرير الضغط المطول
//                   btnColor: Colors.deepOrangeAccent[100]!,
//                 ),
//                 CalculatorButtons(
//                   btnText: '%',
//                   txtColor: Colors.white,
//                   onPressed: widget.buttonPressed,
//                   onLongPress: widget.onLongPress, // تمرير الضغط المطول
//                   btnColor: Colors.deepOrangeAccent[100]!,
//                 ),
//                 CalculatorButtons(
//                   btnText: '÷',
//                   txtColor: Colors.white,
//                   onPressed: widget.buttonPressed,
//                   onLongPress: widget.onLongPress, // تمرير الضغط المطول
//                   btnColor: Colors.deepOrangeAccent[100]!,
//                 ),
//               ],
//             ),
//             // باقي الصفوف ...
//           ],
//         ),
//       ),
//     );
//   }
// }
