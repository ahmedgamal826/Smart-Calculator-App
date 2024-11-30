import 'package:audioplayers/audioplayers.dart';
import 'package:calculator_app_task1/features/home/presentation/views/calculator_view.dart';
import 'package:flutter/material.dart';

class SplashLogic {
  static final AudioPlayer _audioPlayer = AudioPlayer();

  static Future<void> playSoundAndNavigate(BuildContext context) async {
    try {
      await _audioPlayer.play(AssetSource('audios/open_audio.mp3'));

      // Wait for sound to complete before navigating
      await Future.delayed(const Duration(seconds: 2));

      // Navigate to CalculatorView
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const CalculatorView()),
        (route) => false,
      );
    } catch (e) {
      debugPrint("Error playing sound: $e");

      // Fallback navigation in case of error
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const CalculatorView()),
        (route) => false,
      );
    }
  }
}
