import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/components/day_tile.dart';
import 'package:todo_app/components/dialog_box.dart';
import 'package:todo_app/components/todo_item.dart';
import 'package:todo_app/cubits/todo_cubit/todo_cubit.dart';
import 'package:todo_app/models/todo_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final box = Hive.box('todoBox');
  TextEditingController taskName = TextEditingController();
  bool today = true, tomorrow = false, nextWeek = false;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<TodoCubit>(context).loadData('today');
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

  void saveNewTask() {
    if (taskName.text.isNotEmpty) {
      TodoModel todoModel =
          TodoModel(taskName: taskName.text, isCompleted: false);
      BlocProvider.of<TodoCubit>(context).saveNewTask(todoModel, getDay());
      Navigator.pop(context);
      taskName.clear();
    }
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
      body: BlocBuilder<TodoCubit, TodoState>(
        builder: (context, state) {
          return Container(
              padding: const EdgeInsets.only(top: 80, left: 30, right: 30),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(0xff43cea2),
                  Color(0xff185a9d),
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
                          today = true;
                          tomorrow = false;
                          nextWeek = false;
                          BlocProvider.of<TodoCubit>(context)
                              .loadData(getDay());
                        },
                        child: DayTile(
                          day: 'Today',
                          isActive: today,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          today = false;
                          tomorrow = true;
                          nextWeek = false;
                          BlocProvider.of<TodoCubit>(context)
                              .loadData(getDay());
                        },
                        child: DayTile(
                          day: 'Tomorrow',
                          isActive: tomorrow,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          today = false;
                          tomorrow = false;
                          nextWeek = true;
                          BlocProvider.of<TodoCubit>(context)
                              .loadData(getDay());
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
                      itemCount:
                          BlocProvider.of<TodoCubit>(context).toDoList.length,
                      itemBuilder: (context, index) => ToDoItem(
                        todoModel:
                            BlocProvider.of<TodoCubit>(context).toDoList[index],
                        onChanged: (value) =>
                            BlocProvider.of<TodoCubit>(context)
                                .checkBoxChanged(value, index, getDay()),
                        onDelete: (context) =>
                            BlocProvider.of<TodoCubit>(context)
                                .deleteTask(index, getDay()),
                      ),
                    ),
                  ),
                ],
              ));
        },
      ),
    );
  }
}
