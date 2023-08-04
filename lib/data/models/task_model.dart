import 'package:isar/isar.dart';
part 'task_model.g.dart';

@Collection()
class Task {
  Id id = Isar.autoIncrement;
  String? name;
  String? description;
}
