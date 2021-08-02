class TodoItem {
  late int id;
  late String text;
  TodoItem(this.id, this.text);

  // late Map testMap = new Map();
  void changeText(String changeText) {
    //valicdation
    text = changeText;
  }
}
