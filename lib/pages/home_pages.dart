import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task_app/models/task.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Homepge extends StatefulWidget {
  const Homepge({super.key});

  @override
  State<Homepge> createState() => _HomepgeState();
}

class _HomepgeState extends State<Homepge> {
  late double _deviceHeight, _deviceWidth;
  String? _newTaskContent;

  Box? _box;
  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceHeight = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 10,
        scrolledUnderElevation: _deviceHeight * 0.10,
        toolbarHeight: _deviceHeight * 0.60,
        title: const Text(
          'T a s k !',
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 110, 6, 6)),
        ),
      ),
      body: _taskView(),
      backgroundColor: Colors.white,
      floatingActionButton: _addTaskButton(),
    );
  }

  Widget _taskList() {
    List tasks = _box!.values.toList();
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (BuildContext context, int index) {
        var task = Task.fromMap(tasks[index]);
        return ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 25),
          title: Text(
            task.content,
            style: TextStyle(
              decoration: task.isDone ? TextDecoration.lineThrough : null,
            ),
          ),
          trailing: Icon(
            task.isDone
                ? Icons.check_box_outlined
                : Icons.check_box_outline_blank,
            color: const Color.fromARGB(255, 110, 6, 6),
          ),
          subtitle: Text(
            DateTime.now().toString(),
          ),
          onTap: () {
            setState(
              () {
                task.isDone = !task.isDone;
                _box!.putAt(
                  index,
                  task.toMap(),
                );
              },
            );
          },
          onLongPress: () {
            _box!.deleteAt(index);
            setState(() {
              
            });
          },
        );
      },
    );
  }

  Widget _taskView() {
    return FutureBuilder(
      future: Hive.openBox('tasks'),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          _box = snapshot.data;
          return _taskList();
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _addTaskButton() {
    return FloatingActionButton(
      splashColor: const Color.fromARGB(255, 110, 6, 6),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      onPressed: _displayTaskPopop,
      child: const Icon(Icons.add, color: Color.fromARGB(255, 109, 27, 27)),
    );
  }

  void _displayTaskPopop() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.grey[300],
            elevation: 0,
            title: const Text('Add new Task'),
            content: TextField(
              onSubmitted: (_) {
                if (_newTaskContent != null) {
                  var task = Task(
                    content: _newTaskContent!,
                    isDone: false,
                    dateTime: DateTime,
                  );
                  _box!.add(task.toMap());
                  setState(() {
                    _newTaskContent = null;
                    Navigator.pop(context);
                  });
                }
              },
              onChanged: (value) {
                setState(() {
                  _newTaskContent = value;
                });
              },
            ),
          );
        });
  }
}
