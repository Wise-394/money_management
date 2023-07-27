import 'package:flutter/material.dart';
import 'package:money_management/components/add_goal_sheet.dart';
import 'package:money_management/logic/goal_sheet._logic.dart';
import 'package:money_management/screen/tiles/goal_tile.dart';
import 'package:money_management/states/state.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // Listen to changes in AppState
    var appState = context.watch<AppState>();

    var totalMoney = appState.totalMoney;
    var goal = appState.goalList;
    final goalSheetLogic = GoalSheetLogic(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Center(child: Text('Goal Count: ${goal.length}')),
      ),
      body: Column(
        children: [
          Card(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.zero),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: HomeMainTile(totalMoney: totalMoney),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: goal.length,
              itemBuilder: (context, index) {
                return GoalTile(
                  cashInFunction: () =>
                      goalSheetLogic.onCashIn(textController, index),
                  deleteFunction: () => goalSheetLogic.onDeleteGoal(index),
                  context: context,
                  goalTitle: goal[index].goalTitle,
                  goalTarget: goal[index].goalTarget,
                  goalBalance: 0,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class HomeMainTile extends StatelessWidget {
  //methods for addBottomSheet
  void showAddBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return const AddGoalBottomSheet();
        });
  }

  const HomeMainTile({
    super.key,
    required this.totalMoney,
  });

  final int totalMoney;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        trailing: ElevatedButton(
            onPressed: () => showAddBottomSheet(context),
            child: const Text('add new goal')),
        title: const Text('total money saved'),
        subtitle: Text('$totalMoney'));
  }
}
