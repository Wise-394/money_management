import 'package:flutter/material.dart';
import 'package:money_management/Database/goal_entity.dart';
import 'package:money_management/states/state.dart';
import 'package:provider/provider.dart';

class AddGoalSheetLogic {
  void onSave(
    BuildContext context, // Pass the context as a parameter
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
