class Ingredient {
  final String name;
  bool isDone;

  Ingredient({this.name = 'test', this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }
}