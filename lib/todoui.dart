import 'dart:html';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/components/my_card.dart';
import 'package:todolist/provider/todo_provider.dart';

import 'model/todo_item.dart';

class Todoui extends StatefulWidget {
  const Todoui({Key? key}) : super(key: key);
  @override
  _TodouiState createState() => _TodouiState();
}

class _TodouiState extends State<Todoui> {
  TextEditingController _textEditingController = TextEditingController();

  void initTextEditor() {
    _textEditingController.text = '';

    setState(() {});
  }

  void togglePop(BuildContext context) {
    Navigator.of(context).pop();
  }

  void showUpdateOrDeleteDialog(BuildContext context2, TodoItem todo) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              title: Text(
                "Update or Delete Task",
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "${todo.text}",
                    ),
                    autofocus: true,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontFamily: "Raleway",
                    ),
                    controller: _textEditingController,
                  ),
                ],
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      var todoProvider =
                          Provider.of<TodoProvider>(context2, listen: false);
                      todoProvider.updateItem(
                          todo, _textEditingController.text);
                      initTextEditor();
                      togglePop(context);
                    },
                    child: Text('수정하기')),
                TextButton(
                    onPressed: () {
                      var todoProvider =
                          Provider.of<TodoProvider>(context2, listen: false);
                      todoProvider.deleteItem(todo);
                      togglePop(context);
                    },
                    child: Text('삭제하기')),
              ],
            ));
  }

  void showalertdialog(BuildContext context2) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              title: Text(
                "ADD Task",
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                      autofocus: true,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: "Raleway",
                      ),
                      controller: _textEditingController,
                      onSubmitted: (value) {
                        var todoProvider =
                            Provider.of<TodoProvider>(context2, listen: false);
                        todoProvider.addItem(value);
                        initTextEditor();
                        togglePop(context);
                      }),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 10.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: () {
                            var todoProvider = Provider.of<TodoProvider>(
                                context2,
                                listen: false);
                            todoProvider.addItem(_textEditingController.text);
                            _textEditingController.text = '';

                            togglePop(context);
                          },
                          child: Text(
                            "ADD",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontFamily: "Raleway",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ));
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    var todoProvider = Provider.of<TodoProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Todo List ' + '${todoProvider.testMap.length} items',
          style: TextStyle(
            fontFamily: "Raleway",
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black26,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ...todoProvider.testMap.values
                  .toList()
                  .map((e) => MyCard(
                      idxList: todoProvider.idxList,
                      showUpdateOrDeleteDialog: showUpdateOrDeleteDialog,
                      testMap: todoProvider.testMap,
                      todo: e))
                  .toList()
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showalertdialog(context),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.purple,
      ),
    );
  }
}
