import 'package:hive_flutter/adapters.dart';

class Database {
  List toDoList = [];
  final box = Hive.box('todoBox');

  void loadData(String day) {
    if (box.get(day) == null) {
      toDoList = [];
    } else {
      toDoList = box.get(day);
    }
  }

  void updateData(String day) {
    box.put(day, toDoList);
  }
}
