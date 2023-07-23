import 'package:flutter/material.dart';

class GoalTile extends StatefulWidget {
  const GoalTile({super.key});

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
            const Row(
              children: [
                Text('Goal Title'),
              ],
            ),
            const Row(
              children: [
                Text('money balabce/Target Goal'),
                Spacer(),
                Text('X%'),
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
