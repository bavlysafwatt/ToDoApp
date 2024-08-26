import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/components/dialog_box.dart';
import 'package:todo_app/components/todo_item.dart';
import 'package:todo_app/data/database.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final box = Hive.box('todoBox');
  Database database = Database();

  @override
  void initState() {
    super.initState();

    if (box.get('toDoList') == null) {
      database.createInitialData();
    } else {
      database.loadData();
    }
  }

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
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => const DialogBox(),
          );
        },
        backgroundColor: const Color(0xff0ab6ab),
        child: const Icon(
          Icons.add,
          color: Colors.black,
          size: 28,
        ),
      ),
      body: ListView.builder(
        itemCount: database.toDoList.length,
        itemBuilder: (context, index) =>
            ToDoItem(todoModel: database.toDoList[index]),
      ),
    );
  }
}
