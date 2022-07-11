import 'package:flutter/material.dart';

class AMCircleIcon extends StatelessWidget {
  final IconData icon;
  final Color? color;
  final Color? background;
  final double? size;
  final EdgeInsets padding;
  final BorderRadius? radius;
  final TextDirection? textDirection;
  final String? semanticLabel;

  const AMCircleIcon(
    this.icon, {
    Key? key,
    this.color,
    this.background,
    this.size,
    this.padding = const EdgeInsets.all(8.0),
    this.radius,
    this.textDirection,
    this.semanticLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final defaultBG = theme.brightness == Brightness.dark
        ? theme.colorScheme.secondary.withOpacity(0.2)
        : theme.colorScheme.secondary.withOpacity(0.06);
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        //color: background ?? defaultBG,
        color: background ?? defaultBG,
        borderRadius: radius ?? BorderRadius.circular(100.0),
      ),
      child: Icon(
        icon,
        color: color ?? theme.colorScheme.secondary,
        semanticLabel: semanticLabel,
        size: size,
        textDirection: textDirection,
      ),
    );
  }
}
