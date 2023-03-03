import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:task_app/colors.dart';
import 'package:task_app/widgets/bottom_nav_bar.dart';

import '../models/task.dart';

class TaskGrid extends StatefulWidget {
  const TaskGrid({super.key});

  @override
  State<TaskGrid> createState() => _TaskGridState();
}

class _TaskGridState extends State<TaskGrid> {
  String? _newTaskContent;
  Box? _box;
  @override
  Widget build(BuildContext context) {
    List tasks = _box!.values.toList();

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Task List',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: appBarColor,
        ),
        body: GridView.builder(
          itemCount: tasks.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (BuildContext context, int index) {
            var task = Task.fromMap(tasks[index]);
            return Card(
              child: GridTile(
                footer: Text(task.content),
                child: Text(task.content),
              ),
            );
          },
        ),
        bottomNavigationBar: const BottomNavBar());
  }
}
