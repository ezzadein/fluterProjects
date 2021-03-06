import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final title;
  final content;
  final VoidCallback callback;
  final actionText;

  CustomDialog(this.title, this.content, this.callback,
      [this.actionText = "oK"]);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title:  Text(title),
      content: Text(content),
      actions: <Widget>[
        FlatButton(
          onPressed: callback,
          color: Colors.white,
          child: new Text(actionText),
        )
      ],
    );
  }
}