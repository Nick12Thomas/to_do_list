import 'package:flutter/material.dart';
import 'package:to_do_list/widgets/task_tile.dart';
import 'package:to_do_list/models/task.dart';

class TaskView extends StatefulWidget {
  const TaskView({super.key});

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  List<Task> tasks = [
    Task(name: 'Nikhil'),
    Task(name: 'Akhil'),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
            isChecked: tasks[index].isDone, taskTitle: tasks[index].name,checkboxCallback:(checkboxState){
          setState(() {
            tasks[index].toggle();
          });
        });
      },
      itemCount: tasks.length,
    );
  }
}
