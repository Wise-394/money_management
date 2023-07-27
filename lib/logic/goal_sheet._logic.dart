import 'package:flutter/material.dart';
import 'package:money_management/Database/goal_entity.dart';
import 'package:money_management/components/input_dialog.dart';
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
      var goal = GoalEntity(goalTitle.text, double.parse(goalTarget.text), 0.0);
      appState.addGoalToListState(goal);
    }
  }

  void onDeleteGoal(int index) {
    appState.deleteGoalToListState(index);
  }

  void onCashIn() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const InputDialog(
          dialogTitle: 'Cash in',
          dialogHintText: 'Enter Amount Here',
          dialogTextBody: 'How much to cash in?',
        );
      },
    );
  }

  void onSaveCashIn(int index, double cashInAmount) {
    if (cashInAmount != 0) {
      appState.cashInState(index, cashInAmount);
    }
  }
}
