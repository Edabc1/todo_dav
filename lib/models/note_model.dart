class Note {
  final String title;
  final String body;
  bool isCompleted;

  Note({required this.title, required this.body, required this.isCompleted});

  void isDone() {
    isCompleted = !isCompleted;
  }
}
