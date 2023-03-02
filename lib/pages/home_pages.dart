import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task_app/colors.dart';
import 'package:task_app/models/task.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

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
        backgroundColor: appBarColor,
        elevation: 0,
        // scrolledUnderElevation: _deviceHeight * 0.10,
        toolbarHeight: _deviceHeight * 0.2,
        title: const Text(
          'T a s k !',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: _taskView(),
      backgroundColor: backgroundColor,
      bottomNavigationBar: ClipRRect(
        child: Container(
          decoration: BoxDecoration(
            color: bottomNavColor,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: GNav(
                backgroundColor: bottomNavColor,
                color: Colors.black,
                activeColor: Colors.black,
                tabBackgroundColor: Colors.green.shade200,
                padding: const EdgeInsets.all(16),
                gap: 8,
                iconSize: 25,
                tabs: [
                  const GButton(
                    icon: Icons.home,
                    text: 'Home',
                  ),
                  const GButton(
                    icon: Icons.search,
                    text: 'Search',
                  ),
                  const GButton(
                    icon: Icons.settings,
                    text: 'Setting',
                  ),
                  GButton(
                    icon: Icons.add,
                    text: 'Add',
                    onPressed: () {
                      _displayTaskPopop();
                    },
                  ),
                ]),
          ),
        ),
      ),
    );
  }

  Widget _taskList() {
    List tasks = _box!.values.toList();
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (BuildContext context, int index) {
        int itemCount = tasks.length;
        int reversedIndex = itemCount - 1 - index;
        var task = Task.fromMap(tasks[reversedIndex]);
        return Slidable(
          startActionPane: ActionPane(
            motion: const StretchMotion(),
            children: [
              SlidableAction(
                flex: 5,
                backgroundColor: Colors.red.shade500,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                ),
                icon: EvaIcons.trashOutline,
                // label: 'Delete',
                onPressed: (context) {
                  _box!.deleteAt(reversedIndex);
                  setState(() {});
                },
              ),
              SlidableAction(
                flex: 3,
                backgroundColor: Colors.green.shade500,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
                icon: Icons.add,
                // label: 'Add',
                onPressed: (context) {},
              ),
            ],
          ),
          child: ListTile(
            tileColor: backgroundColor,
            iconColor: iconColor,
            textColor: Colors.black87,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            title: Text(
              task.content,
              style: GoogleFonts.openSans(
                fontWeight: FontWeight.w700,
                fontSize: 18,
                decoration: task.isDone ? TextDecoration.lineThrough : null,
                decorationThickness: 5,
                decorationColor: Colors.green.shade500
              ),
            ),
            leading: const Icon(
              EvaIcons.arrowIosForwardOutline,
              // color: Colors.black,
            ),
            trailing: Icon(
              task.isDone
                  ? EvaIcons.checkmarkCircle
                  : EvaIcons.plusCircleOutline,
              // color: const Color.fromARGB(255, 110, 6, 6),
            ),
            subtitle: Text(
              DateTime.now().toString(),
            ),
            onTap: () {
              setState(
                () {
                  task.isDone = !task.isDone;
                  _box!.putAt(reversedIndex, task.toMap());
                },
              );
            },
            onLongPress: () {
              _box!.deleteAt(reversedIndex);
              setState(() {});
            },
          ),
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

  void _displayTaskPopop() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.grey[300],
            icon: const Icon(EvaIcons.activity),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            elevation: 10,
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
