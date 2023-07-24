import 'package:flutter/material.dart';
import 'package:money_management/Database/goal_dbcode.dart';
import 'package:money_management/Database/goal_entity.dart';

class AddGoalSheetLogic {
  var goalDB = GoalDB();
  void onSave(
    final TextEditingController goalTitle,
    final TextEditingController goalTarget,
  ) {
    if (goalTitle.text.isNotEmpty && goalTarget.text.isNotEmpty) {
      var goal = GoalEntity(goalTitle.text, double.parse(goalTarget.text));
      goalDB.goalList.add(goal);
    }
  }
}
