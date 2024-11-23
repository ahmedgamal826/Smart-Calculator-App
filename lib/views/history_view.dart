import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:calculator_app_task1/models/history_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HistoryPage extends StatefulWidget {
  final List<HistoryItem> history;
  final Function(int) onDelete;

  const HistoryPage({
    super.key,
    required this.history,
    required this.onDelete,
  });

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'History',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent[100],
        elevation: 0,
      ),
      body: widget.history.isEmpty
          ? const Center(
              child: Text(
                'No History Available',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: widget.history.length,
              itemBuilder: (context, index) {
                final item = widget.history[index];
                return InkWell(
                  onTap: () {
                    showCardDialog(context, item.equation);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Card(
                      color: Colors.deepOrangeAccent[100],
                      margin: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 15),
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
                              fontWeight: FontWeight.w500),
                        ),
                        subtitle: Text(
                          item.time,
                          style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
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
                          onPressed: () {
                            showDeleteDialog(context, index);
                          },
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }

  void showDeleteDialog(BuildContext context, int index) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.question,
      animType: AnimType.topSlide,
      title: 'Confirm Deletion',
      desc: 'Are you sure you want to delete this item?',
      btnCancelOnPress: () {
        Navigator.of(context).pop();
      },
      titleTextStyle: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      descTextStyle: const TextStyle(fontSize: 18),
      btnOkOnPress: () {
        widget.onDelete(index);
        setState(() {});

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: AwesomeSnackbarContent(
              title: 'Success',
              message: 'Calculation has been deleted successfully!',
              contentType: ContentType.success,
            ),
            backgroundColor: Colors.transparent,
            duration: Duration(seconds: 3),
          ),
        );
      },
      btnOkColor: Colors.red,
      btnCancelColor: Colors.grey,
    ).show();
  }

  void showCardDialog(BuildContext context, String content) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.noHeader,
      animType: AnimType.bottomSlide, // Animation from the bottom
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            content,
            style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () {
              Clipboard.setData(ClipboardData(text: content));
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: AwesomeSnackbarContent(
                    title: 'Copied',
                    message: 'Text copied to clipboard!',
                    contentType: ContentType.success,
                  ),
                  backgroundColor: Colors.transparent,
                  duration: Duration(seconds: 3),
                ),
              );
            },
            icon: const Icon(Icons.copy, color: Colors.white),
            label: const Text(
              "Copy",
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepOrangeAccent[100],
            ),
          ),
        ],
      ),
      btnOkColor: Colors.deepOrangeAccent[100],
      btnOkOnPress: () {},
    ).show();
  }
}
