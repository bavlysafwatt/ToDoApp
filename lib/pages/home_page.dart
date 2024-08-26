import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/components/dialog_box.dart';
import 'package:todo_app/components/todo_item.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/models/todo_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final box = Hive.box('todoBox');
  Database database = Database();
  TextEditingController taskName = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (box.get('toDoList') == null) {
      database.createInitialData();
    } else {
      database.loadData();
    }
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      database.toDoList[index].isCompleted =
          !database.toDoList[index].isCompleted;
    });
    database.updateData();
  }

  void saveNewTask() {
    if (taskName.text.isNotEmpty) {
      TodoModel todoModel =
          TodoModel(taskName: taskName.text, isCompleted: false);
      setState(() {
        database.toDoList.add(todoModel);
        taskName.clear();
      });
      Navigator.pop(context);
      database.updateData();
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
            builder: (context) => DialogBox(
              onTap: saveNewTask,
              title: taskName,
            ),
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
        itemBuilder: (context, index) => ToDoItem(
          todoModel: database.toDoList[index],
          onChanged: (value) => checkBoxChanged(value, index),
        ),
      ),
    );
  }
}
