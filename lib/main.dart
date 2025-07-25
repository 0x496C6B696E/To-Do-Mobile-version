import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/theme/theme.dart';
import 'providers/todo_provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TodoProvider()),
        // İleride başka provider eklemek istersen buraya ekleyebilirsin.
      ],
      child: const ToDoApp(),
    ),
  );
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profesyonel ToDo',
      theme: appTheme,
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
