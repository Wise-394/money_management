import 'package:flutter/material.dart';
import 'package:money_management/screen/tiles/home_main_tile.dart';
import 'package:money_management/logic/goal_sheet._logic.dart';
import 'package:money_management/screen/tiles/goal_tile.dart';
import 'package:money_management/states/state.dart';
import 'package:provider/provider.dart';
import 'package:money_management/Database/goal_entity.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late double totalMoney;
  late List<GoalEntity> goal;
  final TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Load the goalList when the HomePage is created
    context.read<AppState>().loadGoalState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appState, _) {
        // Update the local variables when goalList changes
        totalMoney = appState.totalMoney;
        goal = appState.goalList;

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
                      cashInFunction: () => GoalSheetLogic(context)
                          .onCashIn(textController, index),
                      deleteFunction: () =>
                          GoalSheetLogic(context).onDeleteGoal(index),
                      context: context,
                      goalTitle: goal[index].goalTitle,
                      goalTarget: goal[index].goalTarget,
                      goalBalance: goal[index].goalBalance,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
