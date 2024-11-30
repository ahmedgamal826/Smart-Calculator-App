// // import 'package:flutter/material.dart';

// // class CalculatorButtons extends StatelessWidget {
// //   final String btnText;
// //   final Color txtColor;
// //   final Color btnColor;

// //   final Function(String) onPressed;

// //   const CalculatorButtons({
// //     Key? key,
// //     required this.btnText,
// //     required this.txtColor,
// //     required this.onPressed,
// //     required this.btnColor,
// //   }) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     double width = MediaQuery.of(context).size.width;
// //     return InkWell(
// //       onTap: () => onPressed(btnText),
// //       child: Container(
// //         alignment: Alignment.center,
// //         height: 80,
// //         width: btnText == '=' ? width * 0.45 : 80,
// //         decoration: BoxDecoration(
// //           color: btnColor,
// //           borderRadius: BorderRadius.circular(50),
// //         ),
// //         child: Text(
// //           btnText,
// //           style: TextStyle(
// //             color: txtColor,
// //             fontSize: 30,
// //             fontWeight: FontWeight.w500,
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';

// class CalculatorButtons extends StatelessWidget {
//   final String btnText;
//   final Color txtColor;
//   final Color btnColor;
//   final Function(String) onPressed;
//   final Function(String) onLongPress;

//   // final bool isLongPressed;

//   const CalculatorButtons({
//     Key? key,
//     required this.btnText,
//     required this.txtColor,
//     required this.onPressed,
//     required this.onLongPress,
//     required this.btnColor,
//     // required this.isLongPressed,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     return InkWell(
//       onLongPress: () => onLongPress(btnText),
//       onTap: () => onPressed(btnText),
//       child: Container(
//         alignment: Alignment.center,
//         height: 80,
//         width: btnText == '=' ? width * 0.45 : 80,
//         decoration: BoxDecoration(
//           color: btnColor,
//           borderRadius: BorderRadius.circular(50),
//         ),
//         child: Text(
//           btnText,
//           style: TextStyle(
//             color: txtColor,
//             fontSize: 30,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
//
// class CalculatorButtons extends StatelessWidget {
//   final String btnText;
//   final Color txtColor;
//   final Color btnColor;
//   final Function(String) onPressed;
//   final Function(String) onLongPress;
//
//   const CalculatorButtons({
//     Key? key,
//     required this.btnText,
//     required this.txtColor,
//     required this.onPressed,
//     required this.onLongPress,
//     required this.btnColor,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     return InkWell(
//         onLongPress: () => onPressed(btnText),
//         onTap: () => onLongPress(btnText), //
//         child: Container(
//             alignment: Alignment.center,
//             height: 80,
//             width: btnText == '=' ? width * 0.45 : 80,
//             decoration: BoxDecoration(
//               color: btnColor,
//               borderRadius: BorderRadius.circular(50),
//             ),
//             child: Text(
//               btnText,
//               style: TextStyle(
//                 color: txtColor,
//                 fontSize: 30,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ),
//        );
//    }
// }

import 'package:flutter/material.dart';

class CalculatorButtons extends StatelessWidget {
  final String btnText;
  final Color txtColor;
  final Color btnColor;
  final Function(String) onPressed;
  final Function(String) onLongPress;

  const CalculatorButtons({
    Key? key,
    required this.btnText,
    required this.txtColor,
    required this.onPressed,
    required this.onLongPress,
    required this.btnColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onLongPress: () => onLongPress(btnText),
      onTap: () => onPressed(btnText),
      child: Container(
        alignment: Alignment.center,
        height: 80,
        width: btnText == '=' ? width * 0.45 : 80,
        decoration: BoxDecoration(
          color: btnColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          btnText,
          style: TextStyle(
            color: txtColor,
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
