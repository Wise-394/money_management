import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:money_management/Database/goal_entity.dart';
import 'package:money_management/components/input_dialog.dart';
import 'package:money_management/states/state.dart';
import 'package:provider/provider.dart';

import '../components/edit_goal_sheet.dart';

class GoalSheetLogic {
  final BuildContext context;
  late AppState appState;
  //var appState = Provider.of<AppState>(context, listen: false);
  GoalSheetLogic(this.context) {
    // Move the initialization of appState inside the constructor
    appState = Provider.of<AppState>(context, listen: false);
  }

  double calculatePercentage(double balance, double target) =>
      (balance * target) / 100;

  void onSaveGoal(
    final TextEditingController goalTitle,
    final TextEditingController goalTarget,
  ) {
    if (goalTitle.text.isNotEmpty && goalTarget.text.isNotEmpty) {
      var goal = GoalEntity(goalTitle.text, double.parse(goalTarget.text), 0.0);
      appState.addGoalToListState(goal);
      goalTitle.clear();
      goalTarget.clear();
    }
  }

  void onDeleteGoal(int index) {
    appState.deleteGoalToListState(index);
  }

  void onCashIn(TextEditingController controller, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return InputDialog(
          trueAction: () => onSaveCashIn(index, controller),
          textEditingController: controller,
          dialogTitle: 'Cash in',
          dialogHintText: 'Enter Amount Here',
          dialogTextBody: 'How much to cash in?',
        );
      },
    );
  }

  void onSaveCashIn(int index, TextEditingController controllerText) {
    if (controllerText.text.isNotEmpty) {
      String controllerTextStr = controllerText.text;
      double cashInAmount = double.parse(controllerTextStr);

      appState.cashInState(index, cashInAmount);
      controllerText.clear();
    }
    Navigator.pop(context);
  }

  void showEditGoalBottomSheet(
      int index, String goalTitle, double goalBalance, double goalTarget) {
    var goalSheetLogic = GoalSheetLogic(context);
    var goalTitleEdited = TextEditingController();
    var goalBalanceEdited = TextEditingController();
    var goalTargetEdited = TextEditingController();
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return EditGoalBottomSheet(
            goalTitleController: goalTitleEdited,
            goalBalanceController: goalBalanceEdited,
            goalTargetCOntroller: goalTargetEdited,
            goalTitle: goalTitle,
            goalBalance: goalBalance,
            goalTarget: goalTarget,
            onEditGoal: () => goalSheetLogic.onEditGoal(
                index, goalTitleEdited, goalBalanceEdited, goalTargetEdited),
          );
        });
  }

  bool isNumericString(String input) {
    return double.tryParse(input) != null;
  }

  void onEditGoal(
    int index,
    TextEditingController goalTitle,
    TextEditingController goalBalance,
    TextEditingController goalTarget,
  ) {
    String balanceText = goalBalance.text;
    String targetText = goalTarget.text;

    if (goalTitle.text.isNotEmpty &&
        balanceText.isNotEmpty &&
        targetText.isNotEmpty) {
      if (isNumericString(balanceText) && isNumericString(targetText)) {
        double goalBalanceValue = double.parse(balanceText);
        double goalTargetValue = double.parse(targetText);

        GoalEntity goalEntity = GoalEntity(
          goalTitle.text,
          goalTargetValue,
          goalBalanceValue,
        );

        appState.editGoalState(index, goalEntity);
        Navigator.pop(context);
      } else {
        Navigator.pop(context);
        // Handle invalid input (non-numeric values)
      }
    } else {
      Navigator.pop(context);
    }
  }
}
