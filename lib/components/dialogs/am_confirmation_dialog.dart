import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AMConfirmationDialog extends StatelessWidget {
  final String title;
  final String description;
  final String actionText;
  final String cancelText;

  const AMConfirmationDialog({
    Key key,
    @required this.title,
    @required this.description,
    @required this.actionText,
    @required this.cancelText,
  }) : super(key: key);

  static Future<bool> show(
      BuildContext context,
      String title,
      String description,
      String actionText,
      String cancelText,
  ) {
    return showCupertinoDialog(
      context: context,
      builder: (_) => AMConfirmationDialog(
        title: title,
        description: description,
        actionText: actionText,
        cancelText: cancelText,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title == null ? null : Text(title),
      content: Text(description),
      actions: <Widget>[
        FlatButton(
          child: Text(cancelText ?? "Cancel"),
          onPressed: () => Navigator.pop(context, false),
        ),
        FlatButton(
          child: Text(actionText),
          onPressed: () => Navigator.pop(context, true),
        ),
      ],
    );
  }
}
