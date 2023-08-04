import 'package:flutter/material.dart';
import 'package:isar_example/data/local_db/isar_db.dart';
import 'package:isar_example/data/models/task_model.dart';

class TaskProvider extends ChangeNotifier {
  TaskProvider() {
    read();
  }
  List<Task> _tasks = [];
  List<Task> get tasks => _tasks;

  create(Task task) async =>
      await IsarDatabase.createTask(task).then((value) => read());

  read() async {
    _tasks = await IsarDatabase.getAllTasks();
    notifyListeners();
  }

  update(Task task) async =>
      await IsarDatabase.updateTask(task).then((value) => read());

  delete(int taskId) async =>
      await IsarDatabase.deleteTask(taskId).then((value) => read());
}
