import 'package:intl/intl.dart';

class Task {
  String content;
  // DateTime dateTime ;
  bool isDone;
  // String dateTime = "2023-02-27";
  // DateTime dateTime = DateTime.parse(dateTime);
  DateTime dateTime;

  Task({
    required this.content,
    // required this.dateTime,
    required this.isDone,
    required this.dateTime,
  });

  factory Task.fromMap(Map task) {
    return Task(
      content: task['content'],
      dateTime: task['dateTime'],
      isDone: task['isDone'],
    );
  }

  Map toMap() {
    return {
      'content': content,
      'dateTime': dateTime,
      'isDone': isDone,
    };
  }
}
