import 'package:flutter/material.dart';

class CustomBottomNavbar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavbar({required this.currentIndex, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      selectedItemColor: Theme.of(context).primaryColor,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Lista'),
        BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Criar'),
        BottomNavigationBarItem(icon: Icon(Icons.timer), label: 'Pomodoro'),
      ],
    );
  }
}
