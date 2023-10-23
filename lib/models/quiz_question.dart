class QuizQuestion {
  const QuizQuestion(this.text, this.answers);
  final String text;
  final List<String> answers;

  List getShuffeledList() {
    final shuffeledList = List.of(answers);
    shuffeledList.shuffle();
    return shuffeledList;
  }
}
