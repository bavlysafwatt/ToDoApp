import 'package:flutter/material.dart';
import 'package:todo_app/components/todo_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff151515),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Todo List',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xff0ab6ab),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xff0ab6ab),
        child: const Icon(
          Icons.add,
          color: Colors.black,
          size: 28,
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: ToDoItem(),
      ),
    );
  }
}
