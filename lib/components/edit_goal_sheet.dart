import 'package:flutter/material.dart';

class EditGoalBottomSheet extends StatefulWidget {
  final VoidCallback onEditGoal;
  final String goalTitle;
  final double goalBalance;
  final double goalTarget;
  final TextEditingController goalTitleController;
  final TextEditingController goalBalanceController;
  final TextEditingController goalTargetCOntroller;
  const EditGoalBottomSheet(
      {Key? key,
      required this.goalTitle,
      required this.goalBalance,
      required this.goalTarget,
      required this.onEditGoal,
      required this.goalTitleController,
      required this.goalBalanceController,
      required this.goalTargetCOntroller})
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Text('Edit Goal'),
                const Spacer(),
                ElevatedButton(
                    onPressed: widget.onEditGoal,
                    child: const Icon(Icons.save)),
              ],
            ),
          ),
          const Text('Edit Goal Title'),
          TextField(
            controller: widget.goalTitleController,
            decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(),
                hintText: widget.goalTitle),
          ),
          const Text('Edit Balance'),
          TextField(
            controller: widget.goalBalanceController,
            decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(),
                hintText: widget.goalBalance.toString()),
          ),
          const Text('Edit Target Money'),
          TextField(
            controller: widget.goalTargetCOntroller,
            decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(),
                hintText: widget.goalTarget.toString()),
          ),
        ]),
      ),
    );
  }
}
