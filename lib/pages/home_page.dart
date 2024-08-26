import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/components/day_tile.dart';
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
  bool today = true, tomorrow = false, nextWeek = false;

  @override
  void initState() {
    super.initState();
    database.loadData('today');
  }

  String getDay() {
    if (today) {
      return 'today';
    } else if (tomorrow) {
      return 'tomorrow';
    } else {
      return 'nextWeek';
    }
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      database.toDoList[index].isCompleted =
          !database.toDoList[index].isCompleted;
    });
    database.updateData(getDay());
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
      database.updateData(getDay());
    }
  }

  void deleteTask(int index) {
    setState(() {
      database.toDoList.removeAt(index);
    });
    database.updateData(getDay());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.add,
          color: Color(0xff249fff),
          size: 30,
        ),
      ),
      body: Container(
          padding: const EdgeInsets.only(top: 80, left: 30, right: 30),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              // ignore: use_full_hex_values_for_flutter_colors
              Color(0xff232fda2),
              Color(0xff13d8ca),
              Color(0xff09adfe),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'HELLO\nBAVLY!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Good Morning',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        today = true;
                        tomorrow = false;
                        nextWeek = false;
                        database.loadData(getDay());
                      });
                    },
                    child: DayTile(
                      day: 'Today',
                      isActive: today,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        today = false;
                        tomorrow = true;
                        nextWeek = false;
                        database.loadData(getDay());
                      });
                    },
                    child: DayTile(
                      day: 'Tomorrow',
                      isActive: tomorrow,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        today = false;
                        tomorrow = false;
                        nextWeek = true;
                        database.loadData(getDay());
                      });
                    },
                    child: DayTile(
                      day: 'Next Week',
                      isActive: nextWeek,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(0),
                  itemCount: database.toDoList.length,
                  itemBuilder: (context, index) => ToDoItem(
                    todoModel: database.toDoList[index],
                    onChanged: (value) => checkBoxChanged(value, index),
                    onDelete: (context) => deleteTask(index),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
