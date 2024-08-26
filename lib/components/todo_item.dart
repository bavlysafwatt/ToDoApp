import 'package:flutter/material.dart';
import 'package:todo_app/models/todo_model.dart';

class ToDoItem extends StatelessWidget {
  const ToDoItem({super.key, required this.todoModel, this.onChanged});

  final TodoModel todoModel;
  final void Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color(0xff201f1f),
        ),
        child: ListTile(
          leading: Checkbox(
            value: todoModel.isCompleted,
            onChanged: onChanged,
            activeColor: Colors.white,
            checkColor: Colors.black,
          ),
          title: Text(
            todoModel.taskName,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              decoration:
                  todoModel.isCompleted ? TextDecoration.lineThrough : null,
              decorationColor: todoModel.isCompleted ? Colors.white : null,
            ),
          ),
          trailing: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
