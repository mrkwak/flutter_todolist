import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/model/todo_item.dart';
import 'package:todolist/provider/todo_provider.dart';

class MyCard extends StatelessWidget {
  final List<int> idxList;
  final Function showUpdateOrDeleteDialog;
  final Map<int, TodoItem> testMap;
  final TodoItem todo;
  // final Function listUp;
  // final Function listDown;

  const MyCard(
      {Key? key,
      required this.idxList,
      required this.showUpdateOrDeleteDialog,
      required this.testMap,
      // required this.listUp,
      // required this.listDown,
      required this.todo})
      : super(key: key);

  @override
  Widget build(BuildContext context2) {
    return Card(
      elevation: 5.0,
      margin: EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 5.0,
      ),
      child: InkWell(
        onLongPress: () => showUpdateOrDeleteDialog(context2, todo),
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    // onPressed: () => listUp(todo),
                    onPressed: () {
                      var todoProvider =
                          Provider.of<TodoProvider>(context2, listen: false);
                      todoProvider.listUp(todo);
                    },
                    icon: Icon(Icons.arrow_upward)),
                Text(todo.text),
                IconButton(
                    // onPressed: () => listDown(todo),
                    onPressed: () {
                      var todoProvider =
                          Provider.of<TodoProvider>(context2, listen: false);
                      todoProvider.listDown(todo);
                    },
                    icon: Icon(Icons.arrow_downward)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
