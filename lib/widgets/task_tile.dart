import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function checkboxCallback;
  final Function longPress;
  const TaskTile({super.key, required this.isChecked,required this.taskTitle,required  this.checkboxCallback , required this.longPress});



  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress:longPress() ,
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        value: isChecked,
        onChanged: (newValue){
            checkboxCallback(newValue);
        }, // Pass the function reference here
        activeColor: Colors.blueAccent,
      ),
    );
  }
}
