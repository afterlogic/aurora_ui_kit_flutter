import 'package:flutter/material.dart';

class AMFloatingActionButton extends StatelessWidget {
  final Key? key;
  final void Function()? onPressed;
  final Widget? child;
  final bool autofocus;
  final Color? backgroundColor;
  final Clip clipBehavior;
  final Color? focusColor;
  final FocusNode? focusNode;
  final BoxShadow? shadow;
  final Color? foregroundColor;
  final Object heroTag;
  final Color? hoverColor;
  final bool isExtended;
  final MaterialTapTargetSize? materialTapTargetSize;
  final bool mini;
  final ShapeBorder? shape;
  final Color? splashColor;
  final String? tooltip;

  const AMFloatingActionButton({
    this.key,
    required this.onPressed,
    required this.child,
    this.autofocus = false,
    this.backgroundColor,
    this.clipBehavior = Clip.none,
    this.focusColor,
    this.focusNode,
    this.shadow,
    this.foregroundColor,
    this.heroTag = const _DefaultHeroTag(),
    this.hoverColor,
    this.isExtended = false,
    this.materialTapTargetSize,
    this.mini = false,
    this.shape,
    this.splashColor,
    this.tooltip,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
        boxShadow: onPressed == null
            ? null
            : [
                shadow ??
                    BoxShadow(
                      color: theme.floatingActionButtonTheme.hoverColor ??
                          theme.primaryColor,
                      blurRadius: 8.0,
                      offset: Offset(0.0, 3.0),
                    ),
              ],
      ),
      child: FloatingActionButton(
        key: key,
        autofocus: autofocus,
        backgroundColor: backgroundColor,
        clipBehavior: clipBehavior,
        focusColor: focusColor,
        focusElevation: 0.0,
        focusNode: focusNode,
        foregroundColor: foregroundColor,
        heroTag: heroTag,
        highlightElevation: 0.0,
        hoverColor: hoverColor,
        hoverElevation: 0.0,
        elevation: 0.0,
        isExtended: isExtended,
        materialTapTargetSize: materialTapTargetSize,
        mini: mini,
        onPressed: onPressed,
        shape: shape,
        splashColor: splashColor,
        tooltip: tooltip,
        child: child,
      ),
    );
  }
}

class _DefaultHeroTag {
  const _DefaultHeroTag();

  @override
  String toString() => '<default FloatingActionButton tag>';
}
