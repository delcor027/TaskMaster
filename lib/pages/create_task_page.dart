import 'package:flutter/material.dart';

class CreateTaskPage extends StatelessWidget {
  const CreateTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Adicionar Tarefa")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(decoration: const InputDecoration(labelText: "Título")),
            TextFormField(decoration: const InputDecoration(labelText: "Categoria")),
            TextFormField(decoration: const InputDecoration(labelText: "Descrição")),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: () {}, child: const Text("Criar Tarefa")),
          ],
        ),
      ),
    );
  }
}
