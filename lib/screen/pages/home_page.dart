import 'package:flutter/material.dart';
import 'package:money_management/components/add_goal_sheet.dart';
import 'package:money_management/screen/tiles/goal_tile.dart';
import 'package:money_management/states/total_money_state.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var totalMoneyState = context.watch<TotalMoneyState>();
    var totalMoney = totalMoneyState.totalMoney;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Center(child: Text('Goals')),
      ),
      body: Column(children: [
        Card(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.zero)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: HomeMainTile(totalMoney: totalMoney),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GoalTile(
            goalTitle: 'Title Text',
            goalTarget: 10000,
          ),
        ),
      ]),
    );
  }
}

class HomeMainTile extends StatelessWidget {
  //methods for addBottomSheet
  void showAddBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
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
