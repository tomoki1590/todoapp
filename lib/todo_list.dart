import 'package:flutter/material.dart';
import 'model/todo.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  List<Todo> _todos = [];

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
            trailing: Checkbox(
              value: todo.done,
              onChanged: (checked) {
                setState(() {
                  _todos[index] =
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
