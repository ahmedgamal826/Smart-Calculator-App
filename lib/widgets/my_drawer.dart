import 'package:calculator_app_task1/models/history_model.dart';
import 'package:calculator_app_task1/views/history_view.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final bool isDarkMode;
  final Function toggleDarkMode;
  final List<HistoryItem> history;
  final bool isSoundEnabled;
  final Function toggleSound;
  Function(int) onDelete;

  MyDrawer({
    Key? key,
    required this.isDarkMode,
    required this.toggleDarkMode,
    required this.history,
    required this.isSoundEnabled,
    required this.toggleSound,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.deepOrangeAccent[100],
            ),
            child: Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/logo2.png',
                    height: height * 0.11,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Smart Calculator',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: const Text(
              'Light / Dark Mode',
              style: TextStyle(fontSize: 18),
            ),
            trailing: Switch(
              value: isDarkMode,
              onChanged: (value) => toggleDarkMode(value),
              activeColor: Colors.deepOrangeAccent[100],
            ),
          ),
          const Divider(color: Colors.grey),
          ListTile(
            title: const Text(
              'History',
              style: TextStyle(fontSize: 18),
            ),
            leading: const Icon(
              Icons.history,
              color: Colors.black,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HistoryPage(
                    history: history,
                    onDelete: onDelete,
                  ),
                ),
              );
            },
          ),
          const Divider(color: Colors.grey),
          ListTile(
            title: const Text(
              'Sound',
              style: TextStyle(fontSize: 18),
            ),
            leading: Icon(
              isSoundEnabled ? Icons.volume_up : Icons.volume_off,
              color: isSoundEnabled ? Colors.green : Colors.red,
            ),
            onTap: () {
              toggleSound();
            },
          ),
          const Divider(color: Colors.grey),
        ],
      ),
    );
  }
}