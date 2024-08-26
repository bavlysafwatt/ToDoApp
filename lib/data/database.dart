import 'package:hive_flutter/adapters.dart';
import 'package:todo_app/models/todo_model.dart';

class Database {
  List<TodoModel> toDoList = [];
  final box = Hive.box('todoBox');

  void createInitialData() {
    TodoModel todoModel1 = TodoModel(
      taskName: 'Make Tutorial',
      isCompleted: false,
    );
    TodoModel todoModel2 = TodoModel(
      taskName: 'Do Exercise',
      isCompleted: false,
    );

    toDoList = [todoModel1, todoModel2];
  }

  void loadData() {
    toDoList = box.get('toDoList');
  }

  void updateData() {
    box.put('toDoList', toDoList);
  }
}
