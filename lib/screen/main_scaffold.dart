import 'package:flutter/material.dart';
import 'pages/home_page.dart';

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffold();
}

class _MainScaffold extends State<MainScaffold> {
  var _currentPageIndex = 0;
  List<Widget> body = [HomePage(), const Placeholder(), const Placeholder()];

  void _changeIndex(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  NavigationDestinationLabelBehavior labelBehavior =
      NavigationDestinationLabelBehavior.onlyShowSelected;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body[_currentPageIndex],
      bottomNavigationBar: NavigationBar(
        labelBehavior: labelBehavior,
        selectedIndex: _currentPageIndex,
        onDestinationSelected: (int index) {
          _changeIndex(index);
        },
        destinations: const <Widget>[
          NavigationDestination(icon: Icon(Icons.money), label: 'home'),
          NavigationDestination(icon: Icon(Icons.auto_graph), label: 'stats'),
          NavigationDestination(icon: Icon(Icons.settings), label: 'settings')
        ],
      ),
    );
  }
}
