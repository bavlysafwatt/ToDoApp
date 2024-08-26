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
    return Padding(
      padding: const EdgeInsets.only(left: 22.0, right: 22, top: 22),
      child: Slidable(
        key: const ValueKey(0),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              spacing: 0,
              onPressed: onDelete,
              backgroundColor: Colors.red.shade300,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              borderRadius: BorderRadius.circular(12),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.yellow,
          ),
          child: ListTile(
            leading: Checkbox(
              value: todoModel.isCompleted,
              onChanged: onChanged,
              activeColor: Colors.black,
              checkColor: Colors.white,
            ),
            title: Text(
              todoModel.taskName,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                decoration:
                    todoModel.isCompleted ? TextDecoration.lineThrough : null,
                decorationColor: todoModel.isCompleted ? Colors.black : null,
              ),
            ),
            trailing: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
