import 'package:flutter/material.dart';
import 'model/todo.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  List<Todo> _todos = [
    Todo(title: "ぴよ"),
    Todo(title: "ほげ"),
    Todo(title: "もげ")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TodoApp"),
      ),
      body: ListView.builder(
        itemCount: (_todos.length),
        itemBuilder: (context, index) {
          final todo = _todos[index];
          return ListTile(
            title: Text(todo.title),
            trailing: Checkbox(
              value: todo.done,
              onChanged: (checked) {
                setState(() {
                  _todos[index] =
                  ///Todo 三項演算子
                      Todo(title: todo.title, done: checked = false);
                });
              },
            ),
          );
        },
      ),
    );
  }
}
