import 'package:calculator_app_task1/features/history/data/models/history_model.dart';
import 'package:flutter/material.dart';

class HistoryCard extends StatelessWidget {
  final HistoryItem item;
  final VoidCallback onDelete;
  final VoidCallback onTap;

  const HistoryCard({
    super.key,
    required this.item,
    required this.onDelete,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Card(
          color: Colors.deepOrangeAccent[100],
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.all(15),
            title: Text(
              '${item.equation} = ${item.result}',
              style: const TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: Text(
              item.time,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            leading: const Icon(
              Icons.history,
              color: Colors.white,
            ),
            trailing: IconButton(
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
              onPressed: onDelete,
            ),
          ),
        ),
      ),
    );
  }
}
