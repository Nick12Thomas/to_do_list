import 'package:flutter/material.dart';
import 'package:to_do_list/widgets/task_tile.dart';
import 'package:to_do_list/models/task.dart';

class TaskView extends StatefulWidget {
  late final List<Task> tasks;
  TaskView(this.tasks);


  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
            isChecked: widget.tasks[index].isDone, taskTitle: widget.tasks[index].name,checkboxCallback:(checkboxState){
          setState(() {
            widget.tasks[index].toggle();
          });
        });
      },
      itemCount: widget.tasks.length,
    );
  }
}
