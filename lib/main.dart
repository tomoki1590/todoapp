import 'package:firebase_practice_todo/todo_list.dart';
import 'package:flutter/material.dart';

void main() =>runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TodoMemo",
      theme: ThemeData.light(),
      home: const TodoListPage(),
    );
  }
}
