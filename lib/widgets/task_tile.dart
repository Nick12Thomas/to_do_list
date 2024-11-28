import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function(bool?) checkboxCallback;
  final VoidCallback longPress;

  const TaskTile({
    super.key,
    required this.isChecked,
    required this.taskTitle,
    required this.checkboxCallback,
    required this.longPress,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPress, // Pass the function reference directly
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        value: isChecked,
        onChanged: checkboxCallback, // Pass the function reference directly
        activeColor: Colors.blueAccent,
      ),
    );
  }
}