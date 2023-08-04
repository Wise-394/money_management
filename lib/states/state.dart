import 'package:flutter/material.dart';
import 'package:money_management/Database/goal_entity.dart';
import 'package:money_management/Database/goal_dbcode.dart';

class AppState extends ChangeNotifier {
  final dbGoalCode = GoalDB();
  double totalMoney = 0.0;

  void initTotalMoney() {
    totalMoney = dbGoalCode.loadTotalMoney();
    print('init total money is $totalMoney');
  }

  void addTotalMoney(double totalMoneyToAdd) {
    totalMoney += totalMoneyToAdd;
    print('updated total, totalmoneyTOAdd $totalMoneyToAdd');
    dbGoalCode.updateTotalMoney(
        totalMoney); // Move this line after updating totalMoney
    notifyListeners();
    print('updated total money is $totalMoney');
  }

  void subtractTotalMoney(double totalMoneyToSubtract) {
    totalMoney -= totalMoneyToSubtract;
    dbGoalCode.updateTotalMoney(
        totalMoney); // Move this line after updating totalMoney
    notifyListeners();
    print('updated total money is $totalMoney');
  }

  //for debug
  void resetTotalMoney() {
    totalMoney = 0;
    dbGoalCode.updateTotalMoney(0);
  }

  //goal list related
  List<GoalEntity> goalList = [];
  void addGoalToListState(GoalEntity goalEntity) {
    goalList.add(goalEntity);
    print('New goal added: ${goalEntity.goalTitle} (${goalEntity.goalTarget})');
    dbGoalCode.updateGoalDB(goalList);
    notifyListeners();
  }

  void deleteGoalToListState(int index) {
    print(' goal removed: ${goalList[index].goalTitle}');
    subtractTotalMoney(totalMoney -= goalList[index].goalBalance);
    goalList.removeAt(index);
    dbGoalCode.updateGoalDB(goalList);
    notifyListeners();
  }

  void cashInState(int index, double amount) {
    goalList[index].goalBalance += amount;
    addTotalMoney(amount);
    print('added balance: new balance is ${goalList[index].goalBalance}');
    print('added balance: balance added is $amount');
    dbGoalCode.updateGoalDB(goalList);
    notifyListeners();
  }

  void loadGoalState() {
    goalList = dbGoalCode.loadGoalDB();
    print('db succesfully loaded ${goalList.length}');
  }

  void editGoalState(int index, GoalEntity goal) {
    goalList[index] = goal;
    notifyListeners();
  }
}
