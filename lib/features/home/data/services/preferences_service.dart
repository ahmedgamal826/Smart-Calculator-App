import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:calculator_app_task1/features/history/data/models/history_model.dart';

class PreferencesService {
  Future<void> savePreferences({
    required bool isDarkMode,
    required bool isSoundEnabled,
    required bool isLongEnabled,
    required List<HistoryItem> history,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', isDarkMode);
    prefs.setBool('isSoundEnabled', isSoundEnabled);
    prefs.setBool('isLongSoundEnabled', isLongEnabled);
    prefs.setStringList(
        'history', history.map((item) => jsonEncode(item.toMap())).toList());
  }

  Future<Map<String, dynamic>> loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final isDarkMode = prefs.getBool('isDarkMode') ?? false;
    final isSoundEnabled = prefs.getBool('isSoundEnabled') ?? true;
    final isLongEnabled = prefs.getBool('isLongSoundEnabled') ?? true;
    final historyJson = prefs.getStringList('history');

    final history = historyJson != null
        ? historyJson.map((item) {
            return HistoryItem.fromMap(
              Map<String, dynamic>.from(jsonDecode(item)),
            );
          }).toList()
        : <HistoryItem>[];

    return {
      'isDarkMode': isDarkMode,
      'isSoundEnabled': isSoundEnabled,
      'isLongEnabled': isLongEnabled,
      'history': history,
    };
  }
}
