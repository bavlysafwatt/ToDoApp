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
        borderRadius: BorderRadius.circular(30),
      ),
      content: SingleChildScrollView(
        child: Container(
          height: 250,
          width: 320,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
          child: AddTodoForm(
            onTap: onTap,
            title: title,
          ),
        ),
      ),
    );
  }
}
