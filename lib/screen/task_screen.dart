import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/models/task_data.dart';
import 'package:to_do_list/screen/add_task.dart';
import 'package:to_do_list/widgets/task_view.dart';
import 'package:to_do_list/models/task.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}


class _TaskScreenState extends State<TaskScreen> {
  Widget builderBottom(BuildContext context){
    return  AddScreen((newTaskTitle){
      // setState(() {
      //
      // tasks.add(Task(name: newTaskTitle));
      // });
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      floatingActionButton: FloatingActionButton(onPressed: (){
        showModalBottomSheet(context: context, builder: builderBottom);
      },backgroundColor: Colors.blueAccent,child: const Icon(Icons.add,color: Colors.white,),),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 30,
                  child: Icon(
                    Icons.list,
                    size: 35,
                    color: Colors.blueAccent,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "TO-DO",
                  style:  TextStyle(
                      color: Colors.white60,
                      fontWeight: FontWeight.w700,
                      fontSize: 50),
                ),
                Text(
                  '${Provider.of<TaskData>(context).tasks.length} task remaining',
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20))
              ),
              child: TaskView(Provider.of(context)),
            ),
          )
        ],
      ),
    );
  }
}



