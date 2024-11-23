import 'dart:convert';
import 'package:audioplayers/audioplayers.dart';
import 'package:calculator_app_task1/models/history_model.dart';
import 'package:calculator_app_task1/widgets/calculator_grid.dart';
import 'package:calculator_app_task1/widgets/equation_widget.dart';
import 'package:calculator_app_task1/widgets/my_drawer.dart';
import 'package:calculator_app_task1/widgets/paste_button.dart';
import 'package:calculator_app_task1/widgets/result_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<CalculatorView> {
  bool showPasteButton = true;
  String equation = '0';
  String expression = '';
  String result = '0';
  final FlutterTts flutterTts = FlutterTts();
  bool isSoundEnabled = true;
  bool isDarkMode = false;
  List<HistoryItem> history = [];

  @override
  void initState() {
    super.initState();
    loadPreferences();
  }

  loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isDarkMode = prefs.getBool('isDarkMode') ?? false;
      isSoundEnabled = prefs.getBool('isSoundEnabled') ?? true;
      List<String>? historyJson = prefs.getStringList('history');
      if (historyJson != null) {
        history = historyJson
            .map(
              (item) => HistoryItem.fromMap(
                Map<String, dynamic>.from(
                  jsonDecode(item),
                ),
              ),
            )
            .toList();
      } else {
        history = [];
      }
    });
  }

  savePreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', isDarkMode);
    prefs.setBool('isSoundEnabled', isSoundEnabled);
    List<String> historyJson =
        history.map((item) => jsonEncode(item.toMap())).toList();

    prefs.setStringList('history', historyJson);
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

          String currentTime =
              DateFormat('yyyy-MM-dd hh:mm a').format(DateTime.now());

          history.add(HistoryItem(
              equation: equation, result: result, time: currentTime));

          speakResultWithDelay(result);
          savePreferences();
        } catch (e) {
          result = 'خطأ';
        }
      } else {
        equation = equation == '0' ? btnText : equation + btnText;
      }

      if (isSoundEnabled) {
        if (btnText == '0') playSound('audios/0.mp3');
        if (btnText == '1') playSound('audios/1.mp3');
        if (btnText == '2') playSound('audios/2.mp3');
        if (btnText == '3') playSound('audios/3.mp3');
        if (btnText == '4') playSound('audios/4.mp3');
        if (btnText == '5') playSound('audios/5.mp3');
        if (btnText == '6') playSound('audios/6.mp3');
        if (btnText == '7') playSound('audios/7.mp3');
        if (btnText == '8') playSound('audios/8.mp3');
        if (btnText == '9') playSound('audios/9.mp3');
        if (btnText == 'AC') playSound('audios/AC.mp3');
        if (btnText == '⌫') playSound('audios/x.mp3');
        if (btnText == '%') playSound('audios/%.mp3');
        if (btnText == '÷') playSound('audios/div.mp3');
        if (btnText == 'X') playSound('audios/mul.mp3');
        if (btnText == '-') playSound('audios/-.mp3');
        if (btnText == '+') playSound('audios/+.mp3');
        if (btnText == '=') playSound('audios/=.mp3');
        if (btnText == '.') playSound('audios/..mp3');
      }
    });
  }

  void toggleSound() {
    setState(() {
      isSoundEnabled = !isSoundEnabled;
    });
    savePreferences();
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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      drawer: MyDrawer(
        onDelete: deleteHistory,
        isSoundEnabled: isSoundEnabled,
        isDarkMode: isDarkMode,
        toggleDarkMode: toggleDarkMode,
        history: history,
        toggleSound: toggleSound,
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
            CalculatorGrid(buttonPressed: buttonPressed)
          ],
        ),
      ),
    );
  }
}
