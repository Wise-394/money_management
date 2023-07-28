import 'package:flutter/material.dart';
import 'package:money_management/components/add_goal_sheet.dart';

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

  final double totalMoney;

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
