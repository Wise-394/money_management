import 'package:flutter/material.dart';
import 'package:money_management/Database/goal_entity.dart';
import 'package:money_management/states/state.dart';
import 'package:provider/provider.dart';

class GoalSheetLogic {
  final BuildContext context;
  late AppState appState;
  //var appState = Provider.of<AppState>(context, listen: false);
  GoalSheetLogic(this.context) {
    // Move the initialization of appState inside the constructor
    appState = Provider.of<AppState>(context, listen: false);
  }

  void onSaveGoal(
    final TextEditingController goalTitle,
    final TextEditingController goalTarget,
  ) {
    if (goalTitle.text.isNotEmpty && goalTarget.text.isNotEmpty) {
      var goal = GoalEntity(goalTitle.text, double.parse(goalTarget.text));
      appState.addGoalToListState(goal);
    }
  }

  void onDeleteGoal(int index) {
    appState.deleteGoalToListState(index);
  }
}
