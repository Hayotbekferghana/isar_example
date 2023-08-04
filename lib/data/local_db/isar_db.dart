import 'package:isar/isar.dart';
import 'package:isar_example/data/models/task_model.dart';
import 'package:path_provider/path_provider.dart';

class IsarDatabase {
  static late Isar isar;
  static init() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([TaskSchema], directory: dir.path);
  }

  static Future<int> createTask(Task task) async {
    return await isar.writeTxn(() async => await isar.tasks.put(task));
  }

  static Future<List<Task>> getAllTasks() async {
    return await isar.txn(() async => await isar.tasks.where().findAll());
  }

  static Future<int> updateTask(Task task) async {
    return await isar.writeTxn(() async {
      final oldTask = await isar.tasks.get(task.id);
      oldTask?.description = task.description;
      oldTask?.name = task.name;
      return await isar.tasks.put(oldTask!);
    });
  }

  static Future<bool> deleteTask(int taskId) async {
    return await isar.writeTxn(() => isar.tasks.delete(taskId));
  }
}
