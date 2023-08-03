import 'package:money_management/Database/goal_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

class GoalDB {
  final _goalDbBox = Hive.box('GOALDBBOX');

  void updateGoalDB(List goalList) {
    _goalDbBox.put('GOALLIST', goalList);
  }

  List<GoalEntity> loadGoalDB() {
    List<GoalEntity> goalList =
        _goalDbBox.get('GOALLIST', defaultValue: []).cast<GoalEntity>();
    return goalList;
  }

  //total money
  void updateTotalMoney(double totalMoney) {
    _goalDbBox.put('TOTALMONEY', totalMoney);
  }

  double loadTotalMoney() => _goalDbBox.get('TOTALMONEY', defaultValue: 0.0);
}
