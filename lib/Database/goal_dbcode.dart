import 'package:money_management/Database/goal_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

class GoalDB {
  final _goalDbBox = Hive.box('GOALDBBOX');

  void updateGoalDB(List goalList) {
    _goalDbBox.put('GOALLIST', goalList);
  }

  List<GoalEntity> loadGoalDB() {
    final dynamic data = _goalDbBox.get('GOALLIST');
    if (data == null) {
      return []; // Return an empty list if data is null
    }
    return data.cast<GoalEntity>();
  }
}
