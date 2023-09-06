import 'package:flutter/material.dart';
import 'package:teammate/core/theme/app_colors.dart';
import 'package:teammate/feachers/game/presentation/create_game/presentation/games/games_page.dart';

import 'package:teammate/feachers/players/presentation/teammates_page/teammates_page.dart';

class TabbarPage extends StatefulWidget {
  const TabbarPage({super.key});

  @override
  State<TabbarPage> createState() => _TabbarPageState();
}

class _TabbarPageState extends State<TabbarPage> {
  int _currentIndex = 0;

  static const List<Widget> pages = [GamesPage(), MyTeammmatesPage()];

  void _onIndexChanged(int value) {
    _currentIndex = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onIndexChanged,
        currentIndex: _currentIndex,
        backgroundColor: AppColors.secondaryBackground,
        selectedItemColor: AppColors.main,
        unselectedItemColor: const Color.fromARGB(255, 132, 132, 132),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_basketball),
            label: 'Игры',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_alt),
            label: 'Игроки',
          ),
        ],
      ),
    );
  }
}
