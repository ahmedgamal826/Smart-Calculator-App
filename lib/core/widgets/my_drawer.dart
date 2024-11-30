import 'package:calculator_app_task1/core/helpers/navigate_to_view.dart';
import 'package:calculator_app_task1/features/history/data/models/history_model.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final bool isDarkMode;
  final Function toggleDarkMode;
  final List<HistoryItem> history;
  final bool isSoundEnabled;
  final bool isLongSoundEnabled;
  final Function toggleSound;
  final Function toogleLongSoundEnabled;
  Function(int) onDelete;

  MyDrawer({
    Key? key,
    required this.isDarkMode,
    required this.toggleDarkMode,
    required this.history,
    required this.isSoundEnabled,
    required this.toggleSound,
    required this.onDelete,
    required this.isLongSoundEnabled,
    required this.toogleLongSoundEnabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Drawer(
      width: width * 0.75,
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            color: Colors.deepOrangeAccent[100],
            padding: EdgeInsets.symmetric(
              vertical: height * 0.03,
              horizontal: width * 0.04,
            ),
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset(
                    'assets/images/logo2.png',
                    fit: BoxFit.contain,
                  ),
                ),
                Text(
                  'Smart Calculator',
                  style: TextStyle(
                    fontSize: width * 0.05,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          ListTile(
            title: Text(
              'Light / Dark Mode',
              style: TextStyle(fontSize: width * 0.04),
            ),
            trailing: Switch(
              value: isDarkMode,
              onChanged: (value) => toggleDarkMode(value),
              activeColor: Colors.deepOrangeAccent[100],
            ),
          ),
          const Divider(color: Colors.grey),
          ListTile(
            title: Text(
              'History',
              style: TextStyle(fontSize: width * 0.04),
            ),
            leading: Icon(
              Icons.history,
              size: width * 0.05,
              color: Colors.black,
            ),
            onTap: () {
              NavigateToView(context, history, onDelete);
            },
          ),
          const Divider(color: Colors.grey),
          ListTile(
            title: Text(
              'Sound',
              style: TextStyle(fontSize: width * 0.04),
            ),
            leading: Icon(
              isSoundEnabled ? Icons.volume_up : Icons.volume_off,
              size: width * 0.05,
              color: isSoundEnabled ? Colors.green : Colors.red,
            ),
            onTap: () {
              toggleSound();
            },
          ),
          const Divider(color: Colors.grey),
          ListTile(
            title: Text(
              'Long Pressed',
              style: TextStyle(fontSize: width * 0.04),
            ),
            leading: Icon(
              isLongSoundEnabled ? Icons.remove_red_eye : Icons.visibility_off,
              size: width * 0.05,
              color: isLongSoundEnabled ? Colors.green : Colors.red,
            ),
            onTap: () {
              toogleLongSoundEnabled();
            },
          ),
        ],
      ),
    );
  }
}
