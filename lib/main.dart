import 'package:calculator_app_task1/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}

/////////////// Using Device Preview ////////////////

// import 'package:calculator_app_task1/features/splash/presentation/views/splash_view.dart';
// import 'package:flutter/material.dart';
// import 'package:device_preview/device_preview.dart'; // import the package

// void main() {
//   runApp(
//     DevicePreview(
//       // Wrap your app with DevicePreview
//       builder: (context) => const CalculatorApp(), // Pass the app widget
//       enabled: true, // Enable preview only in debug mode
//     ),
//   );
// }

// class CalculatorApp extends StatelessWidget {
//   const CalculatorApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: SplashView(),
//       builder: DevicePreview.appBuilder, // Add this builder
//     );
//   }
// }
