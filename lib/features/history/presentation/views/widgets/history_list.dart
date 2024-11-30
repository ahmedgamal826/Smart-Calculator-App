import 'package:calculator_app_task1/features/history/data/models/history_model.dart';
import 'package:calculator_app_task1/features/history/presentation/views/widgets/history_card.dart';
import 'package:flutter/material.dart';

class HistoryList extends StatelessWidget {
  final List<HistoryItem> history;
  final Function(int) onDelete;
  final Function(String) onTapItem;

  const HistoryList({
    super.key,
    required this.history,
    required this.onDelete,
    required this.onTapItem,
  });

  @override
  Widget build(BuildContext context) {
    if (history.isEmpty) {
      return const Center(
        child: Text(
          'No History Available',
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      );
    }

    return ListView.builder(
      itemCount: history.length,
      itemBuilder: (context, index) {
        final item = history[index];
        return HistoryCard(
          item: item,
          onDelete: () => onDelete(index),
          onTap: () => onTapItem(item.equation),
        );
      },
    );
  }
}
