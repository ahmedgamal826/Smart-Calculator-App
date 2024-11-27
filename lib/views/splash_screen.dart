// import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:calculator_app_task1/views/calculator_view.dart';
// import 'package:flutter/material.dart';

// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _fadeAnimation;
//   late Animation<double> _scaleAnimation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(seconds: 3),
//       vsync: this,
//     )..forward();

//     _fadeAnimation = Tween(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.easeIn),
//     );

//     _scaleAnimation = Tween(begin: 0.8, end: 1.0).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.easeOut),
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           color: Colors.deepOrangeAccent[100],
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               ScaleTransition(
//                 scale: _scaleAnimation,
//                 child: FadeTransition(
//                   opacity: _fadeAnimation,
//                   child: Container(
//                     child: Image.asset(
//                       'assets/images/logo2.png',
//                       width: width * 0.4,
//                       height: height * 0.2,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               AnimatedTextKit(
//                 animatedTexts: [
//                   TyperAnimatedText(
//                     'Smart Calculator',
//                     textStyle: const TextStyle(
//                       fontSize: 30,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                       shadows: [
//                         Shadow(
//                           color: Colors.black26,
//                           blurRadius: 10,
//                           offset: Offset(2, 2),
//                         ),
//                       ],
//                     ),
//                     textAlign: TextAlign.center,
//                     speed: const Duration(milliseconds: 150),
//                   ),
//                 ],
//                 totalRepeatCount: 1,
//                 pause: const Duration(milliseconds: 900),
//                 displayFullTextOnTap: true,
//                 stopPauseOnTap: true,
//                 onFinished: () {
//                   Navigator.pushAndRemoveUntil(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => const CalculatorView(),
//                     ),
//                     (route) => false,
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:calculator_app_task1/views/calculator_view.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart'; // Import audioplayers

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  final AudioPlayer _audioPlayer = AudioPlayer(); // Initialize AudioPlayer

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..forward();

    _fadeAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _scaleAnimation = Tween(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _audioPlayer.dispose(); // Dispose the audio player
    super.dispose();
  }

  Future<void> _playSoundAndNavigate() async {
    try {
      // Play sound
      await _audioPlayer.play(AssetSource('audios/open_audio.mp3'));
      // Wait for sound to complete before navigating
      await Future.delayed(const Duration(seconds: 2));
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const CalculatorView(),
        ),
        (route) => false,
      );
    } catch (e) {
      debugPrint("Error playing sound: $e");
      // Fallback navigation in case of error
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const CalculatorView(),
        ),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.deepOrangeAccent[100],
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ScaleTransition(
                scale: _scaleAnimation,
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: Container(
                    child: Image.asset(
                      'assets/images/logo2.png',
                      width: width * 0.4,
                      height: height * 0.2,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText(
                    'Smart Calculator',
                    textStyle: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                    speed: const Duration(milliseconds: 150),
                  ),
                ],
                totalRepeatCount: 1,
                pause: const Duration(milliseconds: 900),
                displayFullTextOnTap: true,
                stopPauseOnTap: true,
                onFinished:
                    _playSoundAndNavigate, // Play sound before navigation
              ),
            ],
          ),
        ),
      ),
    );
  }
}
