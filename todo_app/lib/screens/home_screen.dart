import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/todo_provider.dart';
import '../widgets/todo_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context);
    final controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Tasks')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      labelText: 'Yeni görev',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    final text = controller.text.trim();
                    if (text.isNotEmpty) {
                      todoProvider.addTodo(text);
                      controller.clear();
                    }
                  },
                  child: const Text('Ekle'),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: todoProvider.todos.length,
              itemBuilder: (context, index) {
                final todo = todoProvider.todos[index];
                return TodoTile(
                  title: todo.title,
                  isDone: todo.isDone,
                  onToggle: () => todoProvider.toggleTodo(index),
                  onDelete: () => todoProvider.deleteTodo(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
