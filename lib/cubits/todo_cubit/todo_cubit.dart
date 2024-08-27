// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/models/todo_model.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoInitial());

  List toDoList = [];
  final box = Hive.box('todoBox');

  void loadData(String day) {
    if (box.get(day) == null) {
      toDoList = [];
    } else {
      toDoList = box.get(day);
    }
    emit(TodoRefresh());
  }

  void updateData(String day) {
    box.put(day, toDoList);
  }

  void checkBoxChanged(bool? value, int index, String day) {
    toDoList[index].isCompleted = !toDoList[index].isCompleted;
    emit(TodoRefresh());
    updateData(day);
  }

  void saveNewTask(TodoModel todoModel, String day) {
    toDoList.add(todoModel);
    emit(TodoRefresh());
    updateData(day);
  }

  void deleteTask(int index, String day) {
    toDoList.removeAt(index);
    emit(TodoRefresh());
    updateData(day);
  }
}
