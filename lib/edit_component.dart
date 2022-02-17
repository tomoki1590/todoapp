import 'package:firebase_practice_todo/model/todo.dart';
import 'package:flutter/material.dart';

class EditDialog extends StatefulWidget {
  static Future<Todo?> show(BuildContext, context, [Todo? base]) {
    return showDialog(
        context: context, builder: (context) => EditDialog(base: base));
  }

  EditDialog({this.base}) : super();
  final Todo? base;
  @override
  State<EditDialog> createState() => _EditDialogState();
}

class _EditDialogState extends State<EditDialog> {
  late final TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController(text: widget.base?.title);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: TextField(
        controller: _textEditingController,
        decoration: InputDecoration(
            labelText: "Todo",
            hintText: "Todoを追加",
            hintStyle: TextStyle(color: Colors.pink)),
      ),
      actions: [
        ElevatedButton(
            onPressed: () {
              Navigator.pop(
                context,
                Todo(title: _textEditingController.text),
              );
            },
            child: Text("保存")),
      ],
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}
