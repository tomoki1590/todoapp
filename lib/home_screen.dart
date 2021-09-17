import 'package:firebase_practice_todo/edit_component.dart';
import 'package:firebase_practice_todo/model/todo.dart';
import 'package:firebase_practice_todo/repository.dart';
import 'package:flutter/material.dart';

import 'model/todo.dart';

class HomeScreen extends StatefulWidget {
  final TodoRepository repository;
  HomeScreen(this.repository);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
   List <Todo> _todos = [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("TodoApp:"),
        ),
        body: ListView.builder(itemCount: _todos.length,
            itemBuilder: (context, index) {
              final todo = _todos[index];
              return ListTile(
                title: Text(todo.title),
                trailing: Checkbox(value: todo.done,
                  onChanged: (checked) {
                    setState(() {
                      _todos[index] =
                          Todo(title: todo.title, done: checked ?? false);
                    });
                  },),
                onLongPress: ()async{
                  final result =await EditDialog.show(context);
                  if(result !=null){
                    setState(() {
                      _todos[index] = result;
                    });
                  }
                },
              );
            },
        ),
        floatingActionButton:
        FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () async {
            final result = await EditDialog.show(context);
            setState(() {
              _todos.add(result);
            });
          },
        ),
      ),
    );
  }
}