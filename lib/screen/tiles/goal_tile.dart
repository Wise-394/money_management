import 'package:flutter/material.dart';
import 'package:money_management/components/edit_goal_sheet.dart';

class GoalTile extends StatefulWidget {
  final VoidCallback cashInFunction;
  final VoidCallback deleteFunction;
  final BuildContext context;
  final String goalTitle;
  final double goalTarget;
  final double goalBalance;

  const GoalTile({
    Key? key,
    required this.goalTitle,
    required this.goalTarget,
    this.goalBalance = 0,
    required this.context,
    required this.deleteFunction,
    required this.cashInFunction,
  }) : super(key: key);

  @override
  State<GoalTile> createState() => _GoalTile();
}

class _GoalTile extends State<GoalTile> {
  void showEditGoalBottomSheet() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return EditGoalBottomSheet();
        });
  }

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
                Text('${(widget.goalBalance / widget.goalTarget) * 100}%'),
              ],
            ),
            Row(
              children: [
                OutlinedButton(
                  onPressed:
                      widget.deleteFunction, // Fix the onPressed callback here
                  child: const Icon(Icons.delete),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: const Icon(Icons.archive),
                ),
                OutlinedButton(
                  onPressed: () => showEditGoalBottomSheet(),
                  child: const Icon(Icons.edit),
                ),
                const Spacer(),
                OutlinedButton(
                  onPressed: widget.cashInFunction,
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
