class Task {
  String content;
  DateTime timestamp;
  bool isDone;

  Task({
    required this.content,
    required this.timestamp,
    required this.isDone,
  });

  factory Task.fromMap(Map task) {
    return Task(
      content: task['content'],
      timestamp: task['content'],
      isDone: task['content'],
    );
  }

  Map toMap() {
    return {
      'content': content,
      'timestamp': timestamp,
      'isDone': isDone,
    };
  }
}
