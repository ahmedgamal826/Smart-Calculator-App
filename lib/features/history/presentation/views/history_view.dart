import 'package:calculator_app_task1/features/history/data/models/history_model.dart';
import 'package:calculator_app_task1/features/history/presentation/views/widgets/history_list.dart';
import 'package:calculator_app_task1/features/history/presentation/views/widgets/showCardDialog.dart';
import 'package:calculator_app_task1/features/history/presentation/views/widgets/showDeleteDialog.dart';
import 'package:flutter/material.dart';

class HistoryView extends StatefulWidget {
  final List<HistoryItem> history;
  final Function(int) onDelete;

  const HistoryView({
    super.key,
    required this.history,
    required this.onDelete,
  });

  @override
  State<HistoryView> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'History',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent[100],
        elevation: 0,
      ),
      body: HistoryList(
        history: widget.history,
        onDelete: (index) {
          showDeleteDialog(context, () {
            widget.onDelete(index);
            setState(() {});
          });
        },
        onTapItem: (content) => showCardDialog(context, content),
      ),
    );
  }
}
