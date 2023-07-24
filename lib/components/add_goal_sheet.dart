import 'package:flutter/material.dart';

class AddGoalBottomSheet extends StatefulWidget {
  const AddGoalBottomSheet({super.key});

  @override
  State<AddGoalBottomSheet> createState() => _AddGoalBottomSheet();
}

class _AddGoalBottomSheet extends State<AddGoalBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Center(
        child: Column(mainAxisSize: MainAxisSize.max, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text('Title'),
                Spacer(),
                OutlinedButton(onPressed: () {}, child: Icon(Icons.save))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
