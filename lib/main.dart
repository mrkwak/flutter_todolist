import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/provider/todo_provider.dart';
import 'package:todolist/todoui.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        accentColor: Colors.purple,
      ),
      home: ChangeNotifierProvider<TodoProvider>(
          create: (_) => TodoProvider(), child: Todoui()),
    );
  }
}
