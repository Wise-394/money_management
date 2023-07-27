import 'package:flutter/material.dart';

class InputDialog extends StatefulWidget {
  final String dialogTitle;
  final String dialogHintText;
  const InputDialog({
    super.key,
    required this.dialogTitle,
    required this.dialogHintText,
  });

  @override
  State<InputDialog> createState() => _InputDialog();
}

class _InputDialog extends State<InputDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.dialogTitle),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(borderSide: BorderSide()),
              hintText: widget.dialogHintText,
            ),
          ),
        ],
      ),
      actions: [
        ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Icon(Icons.cancel)),
        ElevatedButton(onPressed: () {}, child: const Icon(Icons.check)),
      ],
    );
  }
}
