import 'package:flutter/material.dart';
import 'package:money_management/Database/goal_entity.dart';
import 'package:money_management/states/state.dart';
import 'package:provider/provider.dart';

class AddGoalSheetLogic {
  void onSave(
    final BuildContext context,
    final TextEditingController goalTitle,
    final TextEditingController goalTarget,
  ) {
    if (goalTitle.text.isNotEmpty && goalTarget.text.isNotEmpty) {
      var appState = Provider.of<AppState>(context, listen: false);
      var goal = GoalEntity(goalTitle.text, double.parse(goalTarget.text));
      appState.addGoalToListState(goal);
    }
  }
}

class AddGoalBottomSheet extends StatefulWidget {
  const AddGoalBottomSheet({Key? key}) : super(key: key);

  @override
  State<AddGoalBottomSheet> createState() => _AddGoalBottomSheetState();
}

class _AddGoalBottomSheetState extends State<AddGoalBottomSheet> {
  late AddGoalSheetLogic addGoalSheetLogic;
  final goalTitle = TextEditingController();
  final goalTarget = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Pass the context to AddGoalSheetLogic constructor
    addGoalSheetLogic = AddGoalSheetLogic();
  }

  void onPressSaveButton() {
    addGoalSheetLogic.onSave(
        context, goalTitle, goalTarget); // Pass the context here
    Navigator.of(context).pop();
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
