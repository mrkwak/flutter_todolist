import 'package:flutter/foundation.dart';
import 'package:todolist/model/todo_item.dart';

class TodoProvider extends ChangeNotifier {
  Map<int, TodoItem> _testMap = {};
  List<int> _idxList = [];

  List<TodoItem> _todoList = [];
  int _todoCount = 0;
  get todoCount => _todoCount;
  get testMap => _testMap;
  get idxList => _idxList;

  String getCount() {
    return _testMap.length.toString();
  }

  void listUp(TodoItem todo) {
    _idxList = testMap.keys.toList();
    if (idxList.indexOf(todo.id) > 0) {
      String? oldVal = testMap[idxList[idxList.indexOf(todo.id) - 1]]?.text;
      String? newVal = testMap[todo.id]?.text;
      testMap[idxList[idxList.indexOf(todo.id) - 1]]?.text = newVal!;
      testMap[todo.id]?.text = oldVal!;
      testMap[idxList[idxList.indexOf(todo.id) - 1]]?.text = newVal!;
      notifyListeners();
    }
  }

  void listDown(TodoItem todo) {
    _idxList = testMap.keys.toList();
    if (idxList.indexOf(todo.id) >= 0 &&
        idxList.indexOf(todo.id) + 1 < idxList.length) {
      if (idxList[idxList.indexOf(todo.id) + 1] > 0 &&
          idxList.indexOf(todo.id) + 1 < idxList.length) {
        String? oldVal = testMap[idxList[idxList.indexOf(todo.id) + 1]]?.text;
        String? newVal = testMap[todo.id]?.text;
        testMap[idxList[idxList.indexOf(todo.id)]]?.text = newVal!;
        testMap[todo.id]?.text = oldVal!;
        testMap[idxList[idxList.indexOf(todo.id) + 1]]?.text = newVal!;
        notifyListeners();
      }
    }
  }

  void addItem(String value) {
    if (value.isEmpty) {
      return;
    }
    testMap[_todoCount] = TodoItem(_todoCount, value);
    _todoCount++;
    notifyListeners();
  }

  void updateItem(TodoItem todo, String value) {
    if (value.isEmpty) {
      return;
    }
    todo.changeText(value);
    testMap[todo.id]?.text = value;
  }

  void deleteItem(TodoItem todo) {
    _todoList.remove(todo);
    testMap.remove(todo.id);
    // _todoCount - 1;
  }
}
