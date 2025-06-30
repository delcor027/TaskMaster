import 'package:flutter/material.dart';
import '../widgets/task_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Maio, 2024")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: const [
            TaskCard(title: "Acordar e levar dog pra passear", description: "Tomar café, comer pão e passear."),
            TaskCard(title: "Programar", description: "Resolver bug em produção."),
            TaskCard(title: "Daily", description: "Daily com o time às 9h."),
          ],
        ),
      ),
    );
  }
}
