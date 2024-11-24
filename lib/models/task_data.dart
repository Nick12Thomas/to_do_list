import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:to_do_list/models/task.dart';

class TaskData extends ChangeNotifier{
  final List<Task> _tasks = [

  ];

  UnmodifiableListView<Task> get tasks{
    return UnmodifiableListView(_tasks);
}
  int get taskCount{
    return _tasks.length;
    notifyListeners();
  }

  void addTask(String newTaskTitle){
    final task = Task(name: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task){
    task.toggle();
    notifyListeners();
  }
  void deleteData(Task task){
    _tasks.remove(task);
    notifyListeners();
  }
}