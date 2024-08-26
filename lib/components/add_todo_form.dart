import 'package:flutter/material.dart';
import 'package:todo_app/components/custom_button.dart';
import 'package:todo_app/components/custom_text_field.dart';

class AddTodoForm extends StatelessWidget {
  const AddTodoForm({super.key, required this.onTap, required this.title});

  final void Function() onTap;
  final TextEditingController title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextField(
            hintText: 'Title',
            maxLines: 1,
            controller: title,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomButton(
                text: 'Cancel',
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(width: 8),
              CustomButton(
                text: 'Add',
                onTap: onTap,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
