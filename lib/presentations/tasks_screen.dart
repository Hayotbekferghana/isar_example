import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:isar_example/data/models/task_model.dart';
import 'package:isar_example/provider/task_provider.dart';
import 'package:provider/provider.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: const Text(
          "Tasks",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SizedBox(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: context
              .watch<TaskProvider>()
              .tasks
              .map((task) => Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.deepPurple.withOpacity(0.2),
                          offset: const Offset(10, 10),
                          blurRadius: 60,
                        )
                      ],
                    ),
                    child: ListTile(
                      leading: Text(task.id.toString()),
                      title: Text(task.name.toString()),
                      subtitle: Text(task.description.toString()),
                      dense: true,
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                onPressed: () =>
                                    context.read<TaskProvider>().update(Task()
                                      ..id = task.id
                                      ..name = 'updated task'
                                      ..description = 'new description'),
                                icon: const Icon(
                                  Icons.edit,
                                  color: CupertinoColors.activeGreen,
                                )),
                            IconButton(
                                onPressed: () {
                                  context.read<TaskProvider>().delete(task.id);
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: CupertinoColors.systemRed,
                                )),
                          ],
                        ),
                      ),
                    ),
                  ))
              .toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          final task = Task()
            ..name = 'Important task'
            ..description = "Description";
          context.read<TaskProvider>().create(task);
        },
      ),
    );
  }
}
