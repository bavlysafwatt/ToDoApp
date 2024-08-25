import 'package:flutter/material.dart';
import 'package:todo_app/components/custom_button.dart';
import 'package:todo_app/components/custom_text_field.dart';

class AddTodoForm extends StatefulWidget {
  const AddTodoForm({super.key});

  @override
  State<AddTodoForm> createState() => _AddTodoFormState();
}

class _AddTodoFormState extends State<AddTodoForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  TextEditingController title = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
              // mainAxisSize: MainAxisSize.min,
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
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
