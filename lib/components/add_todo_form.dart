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
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(
                  Icons.cancel,
                  color: Colors.grey.shade800,
                ),
              ),
              const SizedBox(width: 60),
              const Text(
                'Add New Task',
                style: TextStyle(
                  color: Color(0xff008080),
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          Text(
            'Add Text',
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          CustomTextField(
            hintText: 'Enter Text',
            maxLines: 1,
            controller: title,
          ),
          const SizedBox(height: 20),
          Center(
            child: CustomButton(
              text: 'Add',
              onTap: onTap,
            ),
          ),
        ],
      ),
    );
  }
}
