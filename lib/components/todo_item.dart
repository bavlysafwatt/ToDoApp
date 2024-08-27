import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/models/todo_model.dart';

class ToDoItem extends StatelessWidget {
  const ToDoItem(
      {super.key, required this.todoModel, this.onChanged, this.onDelete});

  final TodoModel todoModel;
  final void Function(bool?)? onChanged;
  final void Function(BuildContext)? onDelete;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: const ValueKey(0),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: onDelete,
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            borderRadius: BorderRadius.circular(12),
          ),
        ],
      ),
      child: CheckboxListTile(
        activeColor: const Color.fromARGB(255, 32, 120, 207),
        value: todoModel.isCompleted,
        onChanged: onChanged,
        controlAffinity: ListTileControlAffinity.leading,
        title: Text(
          todoModel.taskName,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w400,
            decoration:
                todoModel.isCompleted ? TextDecoration.lineThrough : null,
            decorationColor: todoModel.isCompleted ? Colors.white : null,
          ),
        ),
        secondary: const Icon(
          Icons.arrow_back_ios,
          size: 16,
          color: Colors.white,
        ),
      ),
    );
  }
}
