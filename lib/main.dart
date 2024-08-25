import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/pages/home_page.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TodoModelAdapter());
  await Hive.openBox('todoBox');
  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        useMaterial3: true,
        fontFamily: 'Ubuntu',
      ),
      home: const HomePage(),
    );
  }
}
