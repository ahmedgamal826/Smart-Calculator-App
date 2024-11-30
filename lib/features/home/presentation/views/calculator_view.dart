import 'package:audioplayers/audioplayers.dart';
import 'package:calculator_app_task1/features/history/data/models/history_model.dart';
import 'package:calculator_app_task1/features/home/data/services/audio_service.dart';
import 'package:calculator_app_task1/features/home/data/services/preferences_service.dart';
import 'package:calculator_app_task1/features/home/presentation/views/widgets/calculator_grid.dart';
import 'package:calculator_app_task1/features/home/presentation/views/widgets/equation_widget.dart';
import 'package:calculator_app_task1/core/widgets/my_drawer.dart';
import 'package:calculator_app_task1/features/home/presentation/views/widgets/paste_button.dart';
import 'package:calculator_app_task1/features/home/presentation/views/widgets/result_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'dart:async';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<CalculatorView> {
  final AudioService audioService = AudioService(); // Using AudioHelper
  final PreferencesService _preferencesService = PreferencesService();

  bool showPasteButton = true;
  String equation = '0';
  String expression = '';
  String result = '0';
  final FlutterTts flutterTts = FlutterTts();
  bool isSoundEnabled = true;
  bool isLongEnabled = true;
  bool isDarkMode = false;
  List<HistoryItem> history = [];

  @override
  void initState() {
    super.initState();
    loadPreferences();
  }

  Future<void> loadPreferences() async {
    final prefs = await _preferencesService.loadPreferences();
    setState(() {
      isDarkMode = prefs['isDarkMode'];
      isSoundEnabled = prefs['isSoundEnabled'];
      isLongEnabled = prefs['isLongEnabled'];
      history = prefs['history'];
    });
  }

  Future<void> savePreferences() async {
    await _preferencesService.savePreferences(
      isDarkMode: isDarkMode,
      isSoundEnabled: isSoundEnabled,
      isLongEnabled: isLongEnabled,
      history: history,
    );
  }

  void playSound(String soundPath) async {
    final player = AudioPlayer();
    await player.play(AssetSource(soundPath));
  }

  Future<void> speakResult(String text) async {
    if (text.isNotEmpty && isSoundEnabled) {
      await flutterTts.setLanguage("ar-SA");
      await flutterTts.setSpeechRate(.7);
      await flutterTts.speak(convertToArabicNumber(text));
    }
  }

  String convertToArabicNumber(String input) {
    final arabicDigits = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
    return input.split('').map((char) {
      if (RegExp(r'\d').hasMatch(char)) {
        return arabicDigits[int.parse(char)];
      }
      return char;
    }).join('');
  }

  Future<void> speakResultWithDelay(String text) async {
    await Future.delayed(const Duration(seconds: 2));
    await speakResult(text);
  }

  buttonPressed(String btnText) {
    setState(() {
      if (isSoundEnabled) {
        if (isLongEnabled == true) {
          playSound('audios/on_pressed.mp3');
        }

        audioService.DelayButtonPressed(btnText, isLongEnabled);
      }
      if (!isLongEnabled) {
        if (btnText == 'AC') {
          equation = '0';
          result = '0';
          showPasteButton = true;
        } else if (btnText == '⌫') {
          equation = equation.substring(0, equation.length - 1);
          if (equation == '') equation = '0';
        } else if (btnText == '=') {
          expression = equation;
          expression = expression.replaceAll('X', '*');
          expression = expression.replaceAll('÷', '/');

          try {
            Parser p = Parser();
            Expression exp = p.parse(expression);
            ContextModel cm = ContextModel();

            result = '${exp.evaluate(EvaluationType.REAL, cm)}';

            speakResultWithDelay(result);
            String currentTime =
                DateFormat('yyyy-MM-dd hh:mm a').format(DateTime.now());

            history.add(HistoryItem(
                equation: equation, result: result, time: currentTime));

            savePreferences();
          } catch (e) {
            result = 'خطأ';
          }
        } else {
          equation = equation == '0' ? btnText : equation + btnText;
        }
      }
    });
  }

  void onLongPress(String btnText) {
    setState(() {
      if (isSoundEnabled) {
        audioService.DelayOnLongPressed(btnText);
      }

      if (btnText == 'AC') {
        equation = '0';
        result = '0';
        showPasteButton = true;
      } else if (btnText == '⌫') {
        equation = equation.substring(0, equation.length - 1);
        if (equation == '') equation = '0';
      } else if (btnText == '=') {
        expression = equation;
        expression = expression.replaceAll('X', '*');
        expression = expression.replaceAll('÷', '/');

        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);
          ContextModel cm = ContextModel();

          result = '${exp.evaluate(EvaluationType.REAL, cm)}';

          speakResultWithDelay(result);
          String currentTime =
              DateFormat('yyyy-MM-dd hh:mm a').format(DateTime.now());

          history.add(HistoryItem(
              equation: equation, result: result, time: currentTime));

          savePreferences();
        } catch (e) {
          result = 'خطأ';
        }
      } else {
        equation = equation == '0' ? btnText : equation + btnText;
      }
    });
  }

  void toggleSound() {
    setState(() {
      isSoundEnabled = !isSoundEnabled;
      savePreferences();
    });
  }

  void toggleLongSoundEnabled() {
    setState(() {
      isLongEnabled = !isLongEnabled;
      savePreferences();
    });
  }

  void toggleDarkMode(bool value) {
    setState(() {
      isDarkMode = value;
      savePreferences();
    });
  }

  Future<void> pasteFromClipboard() async {
    Clipboard.getData('text/plain').then((value) {
      if (value != null && value.text != null) {
        setState(() {
          equation = value.text!;
          showPasteButton = false;
        });
      }
    });
  }

  void deleteHistory(int index) {
    setState(() {
      history.removeAt(index);
      savePreferences();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      drawer: MyDrawer(
        onDelete: deleteHistory,
        isSoundEnabled: isSoundEnabled,
        isLongSoundEnabled: isLongEnabled,
        isDarkMode: isDarkMode,
        toggleDarkMode: toggleDarkMode,
        history: history,
        toggleSound: toggleSound,
        toogleLongSoundEnabled: toggleLongSoundEnabled,
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white, size: 30),
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent[100],
        title: const Text(
          'Smart Calculator',
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.normal),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                EquationWidget(isDarkMode: isDarkMode, equation: equation),
                if (showPasteButton)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const SizedBox(width: 5),
                      PasteButton(pasteFromClipboard: pasteFromClipboard),
                    ],
                  ),
              ],
            ),
            const SizedBox(height: 20),
            ResultWidget(isDarkMode: isDarkMode, result: result),
            CalculatorGrid(
              buttonPressed: buttonPressed,
              onLongPress: onLongPress,
              isLongPressEnabled: isLongEnabled,
            )
          ],
        ),
      ),
    );
  }
}
