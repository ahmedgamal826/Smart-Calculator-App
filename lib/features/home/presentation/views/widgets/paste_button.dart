import 'package:flutter/material.dart';

class PasteButton extends StatelessWidget {
  PasteButton({super.key, required this.pasteFromClipboard});

  final VoidCallback? pasteFromClipboard;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const SizedBox(width: 5),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: pasteFromClipboard,
            child: const Row(
              children: [
                Icon(
                  Icons.content_paste_outlined,
                  color: Colors.black,
                ),
                Text(
                  'Paste',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
