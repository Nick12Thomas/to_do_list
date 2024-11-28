import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/models/task_data.dart';
import 'package:to_do_list/widgets/task_tile.dart';


class TaskView extends StatelessWidget {
  const TaskView({super.key});



  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context,taskData,child){
        return  ListView.builder(
          itemBuilder: (context, index) {
            final task=taskData.tasks[index];
            return TaskTile(
                isChecked: task.isDone,
                taskTitle: task.name,
                longPress: (){
                  taskData.deleteData(task);
                },
                checkboxCallback: (checkboxState) {
                 taskData.updateTask(task);
                });
          },
          itemCount: taskData.taskCount,
        );
      },

    );
  }
}
