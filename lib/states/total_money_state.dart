import 'package:flutter/material.dart';

class TotalMoneyState extends ChangeNotifier {
  var totalMoney = 0;

  void initTotalMoney(int newTotalMoney) {
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
}
