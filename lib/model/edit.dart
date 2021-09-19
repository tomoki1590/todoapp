import 'package:flutter/material.dart';
class EditDialog extends StatefulWidget {
  const EditDialog({Key? key}) : super(key: key);

  @override
  _EditDialogState createState() => _EditDialogState();
}

class _EditDialogState extends State<EditDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: TextField(
decoration: InputDecoration(hintText: "Todo"),
      ),
    );
  }
}
