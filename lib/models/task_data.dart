import 'package:flutter/foundation.dart';
import 'package:to_do_list/models/task.dart';

class TaskData extends ChangeNotifier{
  List<Task> tasks = [
    Task(name: 'Nikhil'),
    Task(name: 'Akhil'),
  ];
}