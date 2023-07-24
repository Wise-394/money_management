import 'package:flutter/material.dart';

class GoalTile extends StatefulWidget {
  final String goalTitle;
  final double goalTarget;
  final double goalBalance;
  GoalTile({
    super.key,
    required this.goalTitle,
    required this.goalTarget,
    this.goalBalance = 0,
  });

  @override
  State<GoalTile> createState() => _GoalTile();
}

class _GoalTile extends State<GoalTile> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(widget.goalTitle),
              ],
            ),
            Row(
              children: [
                Text(widget.goalBalance.toString()),
                const Spacer(),
                Text(widget.goalTarget.toString()),
                const Text('  | X%'),
              ],
            ),
            Row(
              children: [
                OutlinedButton(
                  onPressed: () {},
                  child: const Icon(Icons.delete),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: const Icon(Icons.archive),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: const Icon(Icons.edit),
                ),
                const Spacer(),
                OutlinedButton(
                  onPressed: () {},
                  child: const Icon(Icons.attach_money),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
