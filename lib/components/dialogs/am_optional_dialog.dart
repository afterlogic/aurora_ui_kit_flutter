import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OptionalResult {
  final bool? generalResult;
  final Map<String, bool>? options;

  OptionalResult({
    this.generalResult,
    this.options,
  });
}

class AMOptionalDialog extends StatefulWidget {
  final String? title;
  final String? description;
  final Map<String, bool> options;
  final String actionText;
  final String cancelText;
  final List<Widget>? actions;

  const AMOptionalDialog({
    this.title,
    this.description,
    required this.options,
    this.actionText = "OK",
    this.cancelText = "Cancel",
    this.actions,
  });

  static Future<OptionalResult?> show({
    required BuildContext context,
    String? title,
    String? description,
    required Map<String, bool> options,
    required String actionText,
    required String cancelText,
    List<Widget>? actions,
  }) {
    return showCupertinoDialog<OptionalResult>(
        context: context,
        builder: (_) => AMOptionalDialog(
              title: title,
              description: description,
              options: options,
              actionText: actionText,
              cancelText: cancelText,
              actions: actions,
            ));
  }

  @override
  _OptionalDialogState createState() => _OptionalDialogState();
}

class _OptionalDialogState extends State<AMOptionalDialog> {
  String? title;
  String? description;
  late Map<String, bool> options;
  late String actionText;
  late String cancelText;
  List<Widget>? actions;

  @override
  void initState() {
    super.initState();
    title = widget.title;
    description = widget.description;
    options = widget.options;
    actionText = widget.actionText;
    cancelText = widget.cancelText;
    actions = widget.actions;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      if (description != null)
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Text(description!),
        )
    ];
    for (final key in options.keys) {
      final row = GestureDetector(
        onTap: () => _onTapOption(key),
        child: Row(
          children: [
            Checkbox(
              value: options[key],
              onChanged: (_) => _onTapOption(key),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Text(key),
              ),
            ),
          ],
        ),
      );

      children.add(row);
    }
    return AlertDialog(
      title: title == null ? null : Text(title!),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: children,
      ),
      actions: <Widget>[
        TextButton(
          child: Text(cancelText),
          onPressed: () => Navigator.pop(
            context,
            OptionalResult(generalResult: false, options: options),
          ),
        ),
        if (actions != null) ...actions!,
        TextButton(
          child: Text(actionText),
          onPressed: () => Navigator.pop(
            context,
            OptionalResult(generalResult: true, options: options),
          ),
        ),
      ],
    );
  }

  void _onTapOption(String key) {
    setState(() {
      options[key] = !(options[key] ?? false);
    });
  }
}
