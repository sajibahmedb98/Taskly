class Task {
  String content;
  // DateTime dateTime ;
  bool isDone;
  // String dateTime = "2023-02-27";
  // DateTime dateTime = DateTime.parse(dateTime);

  final dateTime = DateTime.now();

  Task({
    required this.content,
    // required this.dateTime,
    required this.isDone, required dateTime,
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
