import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AMDialog extends StatelessWidget {
  final List<Widget> actions;
  final Color backgroundColor;
  final Widget content;
  final EdgeInsetsGeometry contentPadding;
  final TextStyle contentTextStyle;
  final double elevation;
  final String semanticLabel;
  final ShapeBorder shape;
  final Widget title;
  final EdgeInsetsGeometry titlePadding;
  final TextStyle titleTextStyle;

  const AMDialog({
    Key key,
    this.actions,
    this.backgroundColor,
    this.content,
    this.contentPadding = const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0),
    this.contentTextStyle,
    this.elevation,
    this.semanticLabel,
    this.shape,
    this.title,
    this.titlePadding,
    this.titleTextStyle,
  }) : super(key: key);

  static Future<T> show<T>(
    BuildContext context,
    Widget Function(BuildContext) builder,
    bool useRootNavigator,
  ) {
    return showCupertinoDialog(context: context, builder: builder);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: actions,
      backgroundColor: backgroundColor,
      content: content,
      contentPadding: contentPadding,
      contentTextStyle: contentTextStyle,
      elevation: elevation,
      semanticLabel: semanticLabel,
      shape: shape,
      title: title,
      titlePadding: titlePadding,
      titleTextStyle: titleTextStyle,
    );
  }
}
