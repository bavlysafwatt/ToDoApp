import 'package:flutter/material.dart';
import 'package:todo_app/components/add_todo_form.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({super.key, required this.onTap, required this.title});

  final void Function() onTap;
  final TextEditingController title;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 0,
      contentPadding: EdgeInsets.zero,
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      content: Container(
        height: 150,
        width: 500,
        decoration: BoxDecoration(
          color: Colors.yellow[300],
          borderRadius: BorderRadius.circular(5),
        ),
        child: AddTodoForm(
          onTap: onTap,
          title: title,
        ),
      ),
    );
  }
}
