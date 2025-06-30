import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'pages/home_page.dart';
import 'pages/create_task_page.dart';
import 'pages/focus_mode_page.dart';
import 'widgets/custom_bottom_navbar.dart';

void main() => runApp(const TaskMasterApp());

class TaskMasterApp extends StatefulWidget {
  const TaskMasterApp({super.key});

  @override
  State<TaskMasterApp> createState() => _TaskMasterAppState();
}

class _TaskMasterAppState extends State<TaskMasterApp> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    CreateTaskPage(),
    FocusModePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: CustomBottomNavbar(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
        ),
      ),
    );
  }
}
