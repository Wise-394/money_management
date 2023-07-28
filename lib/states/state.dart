import 'package:flutter/material.dart';
import 'package:money_management/Database/goal_entity.dart';
import 'package:money_management/Database/goal_dbcode.dart';

class AppState extends ChangeNotifier {
  double totalMoney = 0.0;

  void initTotalMoney(double newTotalMoney) {
    totalMoney = newTotalMoney;
    notifyListeners();
  }

  void addTotalMoney(int totalMoneyToAdd) {
    totalMoney += totalMoneyToAdd;
    notifyListeners();
  }

  void subtractTotalMoney(int totalMoneyToSubtract) {
    totalMoney -= totalMoneyToSubtract;
    notifyListeners();
  }

  //goal list related
  List<GoalEntity> goalList = [];
  final dbGoalCode = GoalDB();
  void addGoalToListState(GoalEntity goalEntity) {
    goalList.add(goalEntity);
    print('New goal added: ${goalEntity.goalTitle} (${goalEntity.goalTarget})');
    dbGoalCode.updateGoalDB(goalList);
    notifyListeners();
  }

  void deleteGoalToListState(int index) {
    print(' goal removed: ${goalList[index].goalTitle}');
    goalList.removeAt(index);
    dbGoalCode.updateGoalDB(goalList);
    notifyListeners();
  }

  void cashInState(int index, double amount) {
    goalList[index].goalBalance += amount;
    totalMoney += amount;
    print('added balance ${goalList[index].goalBalance}');
    dbGoalCode.updateGoalDB(goalList);
    notifyListeners();
  }

  void loadGoalState() {
    if (goalList.isEmpty) {
      goalList = dbGoalCode.loadGoalDB();
      print('db succesfully loaded ${goalList.length}');
    }
  }
}
