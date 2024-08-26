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
        borderRadius: BorderRadius.circular(10),
      ),
      content: Container(
        height: 150,
        width: 500,
        decoration: BoxDecoration(
          color: const Color(0xff0ab6ab),
          borderRadius: BorderRadius.circular(10),
        ),
        child: AddTodoForm(
          onTap: onTap,
          title: title,
        ),
      ),
    );
  }
}
