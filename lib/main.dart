import 'package:flutter/material.dart';
import 'package:task_app/pages/home_pages.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter('hive_boxes');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const Homepge(),
    );
  }
}
