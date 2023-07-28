import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

part 'goal_entity.g.dart';

@HiveType(typeId: 0)
class GoalEntity extends HiveObject {
  @HiveField(0)
  String goalTitle;

  @HiveField(1)
  double goalTarget;

  @HiveField(2)
  double goalBalance;

  GoalEntity(
    this.goalTitle,
    this.goalTarget,
    this.goalBalance,
  );
}
