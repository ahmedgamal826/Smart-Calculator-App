import 'package:calculator_app_task1/features/history/data/models/history_model.dart';
import 'package:calculator_app_task1/features/history/presentation/views/history_view.dart';
import 'package:flutter/material.dart';

void NavigateToView(
    BuildContext context, List<HistoryItem> history, Function(int) onDelete) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => HistoryView(
        history: history,
        onDelete: onDelete,
      ),
    ),
  );
}
