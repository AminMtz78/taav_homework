class Todo {


  String title;
  String description;
  String state = 'pending';
  int score;

  Todo({required this.title, required this.description, required this.score});

  @override
  String toString() {
    return 'Todo{title: $title, description: $description, state: $state, score: $score}';
  }
}