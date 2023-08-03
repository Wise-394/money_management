import 'package:flutter/material.dart';

class EditGoalBottomSheet extends StatefulWidget {
  const EditGoalBottomSheet({Key? key}) : super(key: key);

  @override
  State<EditGoalBottomSheet> createState() => _EditGoalBottomSheet();
}

class _EditGoalBottomSheet extends State<EditGoalBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: const SizedBox(
        height: 300,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text('Edit Goal'),
                Spacer(),
                Icon(Icons.save),
              ],
            ),
          ),
          Text('Edit Goal Title'),
          TextField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(),
            ),
          ),
          Text('Edit Balance'),
          TextField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(),
            ),
          ),
          Text('Edit Target Balance'),
          TextField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(),
            ),
          ),
        ]),
      ),
    );
  }
}
