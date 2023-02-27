import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: _deviceHeight * 0.60,
        title: const Text(
          'T a s k l y !',
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
    return ListView(
      children: [
        ListTile(
          title: const Text(
            'Do Laundry',
            style: TextStyle(
              decoration: TextDecoration.none,
            ),
          ),
          trailing: const Icon(
            Icons.check_box_outlined,
            color: Color.fromARGB(255, 110, 6, 6),
          ),
          subtitle: Text(
            DateTime.now().toString(),
          ),
        ),
        ListTile(
          title: const Text(
            'Morning Walk',
            style: TextStyle(
              decoration: TextDecoration.none,
            ),
          ),
          trailing: const Icon(
            Icons.check_box_outlined,
            color: Color.fromARGB(255, 110, 6, 6),
          ),
          subtitle: Text(
            DateTime.now().toString(),
          ),
        ),
        ListTile(
          title: const Text(
            'Do Coding',
            style: TextStyle(
              decoration: TextDecoration.lineThrough,
            ),
          ),
          trailing: const Icon(
            Icons.check_box_outlined,
            color: Color.fromARGB(255, 110, 6, 6),
          ),
          subtitle: Text(
            DateTime.now().toString(),
          ),
        ),
        ListTile(
          title: const Text(
            'Do Coding',
            style: TextStyle(
              decoration: TextDecoration.lineThrough,
            ),
          ),
          trailing: const Icon(
            Icons.check_box_outlined,
            color: Color.fromARGB(255, 110, 6, 6),
          ),
          subtitle: Text(
            DateTime.now().toString(),
          ),
        ),
      ],
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
      splashColor: Colors.red,
      backgroundColor: const Color.fromARGB(255, 110, 6, 6),
      onPressed: _displayTaskPopop,
      child: const Icon(Icons.add, color: Colors.white),
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
              onSubmitted: (value) {},
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
