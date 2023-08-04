import 'package:flutter/material.dart';
import 'package:isar_example/presentations/tasks_screen.dart';
import 'package:isar_example/provider/task_provider.dart';
import 'package:provider/provider.dart';

import 'data/local_db/isar_db.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await IsarDatabase.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider(
        create: (context) => TaskProvider(),
        child: const TasksScreen(),
      ),
    );
  }
}
