import 'package:flutter/material.dart';
import 'package:money_management/states/state.dart';

class InputDialog extends StatefulWidget {
  final VoidCallback trueAction;
  final String dialogTitle;
  final String dialogHintText;
  final String dialogTextBody;
  final TextEditingController textEditingController;
  const InputDialog({
    super.key,
    required this.dialogTitle,
    required this.dialogHintText,
    required this.dialogTextBody,
    required this.textEditingController,
    required this.trueAction,
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
          Text(widget.dialogTextBody),
          TextField(
            controller: widget.textEditingController,
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
        ElevatedButton(
            onPressed: widget.trueAction, child: const Icon(Icons.check)),
      ],
    );
  }
}
