import 'package:audioplayers/audioplayers.dart';

class AudioService {
  final AudioPlayer _player = AudioPlayer();

  void playSound(String soundPath) async {
    final player = AudioPlayer();
    await player.play(AssetSource(soundPath));
  }

  Future<Null> DelayButtonPressed(String btnText, bool isLongEnabled) {
    return Future.delayed(Duration(milliseconds: !isLongEnabled ? 100 : 900),
        () {
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
      if (btnText == '⌫') playSound('audios/remove_digit.mp3');
      if (btnText == '%') playSound('audios/%.mp3');
      if (btnText == '÷') playSound('audios/div.mp3');
      if (btnText == 'X') playSound('audios/mul.mp3');
      if (btnText == '-') playSound('audios/-.mp3');
      if (btnText == '+') playSound('audios/+.mp3');
      if (btnText == '=') playSound('audios/=.mp3');
      if (btnText == '.') playSound('audios/..mp3');
    });
  }

  Future<Null> DelayOnLongPressed(String btnText) {
    return Future.delayed(const Duration(milliseconds: 500), () {
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
      if (btnText == '⌫') playSound('audios/remove_digit.mp3');
      if (btnText == '%') playSound('audios/%.mp3');
      if (btnText == '÷') playSound('audios/div.mp3');
      if (btnText == 'X') playSound('audios/mul.mp3');
      if (btnText == '-') playSound('audios/-.mp3');
      if (btnText == '+') playSound('audios/+.mp3');
      if (btnText == '=') playSound('audios/=.mp3');
      if (btnText == '.') playSound('audios/..mp3');
    });
  }
}
