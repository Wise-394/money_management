import 'package:flutter/material.dart';

class EditGoalBottomSheet extends StatefulWidget {
  final String goalTitle;
  final double goalBalance;
  final double goalTarget;
  const EditGoalBottomSheet(
      {Key? key,
      required this.goalTitle,
      required this.goalBalance,
      required this.goalTarget})
      : super(key: key);

  @override
  State<EditGoalBottomSheet> createState() => _EditGoalBottomSheet();
}

class _EditGoalBottomSheet extends State<EditGoalBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SizedBox(
        height: 300,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text('Edit Goal'),
                Spacer(),
                Icon(Icons.save),
              ],
            ),
          ),
          const Text('Edit Goal Title'),
          TextField(
            decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(),
                hintText: widget.goalTitle),
          ),
          const Text('Edit Balance'),
          TextField(
            decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(),
                hintText: widget.goalBalance.toString()),
          ),
          const Text('Edit Target Balance'),
          TextField(
            decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(),
                hintText: widget.goalTarget.toString()),
          ),
        ]),
      ),
    );
  }
}
