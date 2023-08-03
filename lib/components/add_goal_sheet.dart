import 'package:flutter/material.dart';
import 'package:money_management/logic/goal_sheet._logic.dart';

class AddGoalBottomSheet extends StatefulWidget {
  const AddGoalBottomSheet({Key? key}) : super(key: key);

  @override
  State<AddGoalBottomSheet> createState() => _AddGoalBottomSheetState();
}

class _AddGoalBottomSheetState extends State<AddGoalBottomSheet> {
  late GoalSheetLogic addGoalSheetLogic;
  final goalTitle = TextEditingController();
  final goalTarget = TextEditingController();

  void onPressSaveButton() {
    addGoalSheetLogic.onSaveGoal(
      goalTitle,
      goalTarget,
    );
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    super.initState();
    addGoalSheetLogic = GoalSheetLogic(context);
  }

  @override
  void dispose() {
    goalTitle.dispose();
    goalTarget.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SizedBox(
        height: 300,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Text('Add A New Goal'),
                  const Spacer(),
                  OutlinedButton(
                    onPressed: onPressSaveButton,
                    child: const Icon(Icons.save),
                  ),
                ],
              ),
            ),
            const Text('Goal Title'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: goalTitle,
                decoration:
                    const InputDecoration(hintText: 'Eg. Buy a new phone'),
              ),
            ),
            const Text('Target Money'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: goalTarget,
                decoration: const InputDecoration(hintText: 'Eg. \$1000'),
                keyboardType: TextInputType.number,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
