import 'package:firebase_practice_todo/model/todo.dart';
import 'package:flutter/material.dart';

class EditDialog extends StatefulWidget {

  static Future<void> show(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => EditDialog(),
    );
  }

  EditDialog({this.base}) : super();
  final Todo? base;

  @override
  _EditDialogState createState() => _EditDialogState();
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
        decoration: InputDecoration(hintText: "TODO"),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(
              context,
              Todo(title: "後でここに入力値を入れます"),
            );
          },
          child: Text("保存する"),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}
