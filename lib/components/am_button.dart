import 'package:flutter/material.dart';

class AMButton extends StatelessWidget {
  final void Function()? onPressed;
  final Widget child;
  final void Function()? onLongPress;
  final bool? isLoading;
  final Duration? animationDuration;
  final bool autofocus;
  final Clip clipBehavior;
  final Color? color;
  final BoxShadow? shadow;
  final BorderRadius? radius;
  final FocusNode? focusNode;
  final double height;
  final EdgeInsetsGeometry padding;

  const AMButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.onLongPress,
    this.isLoading,
    this.animationDuration,
    this.autofocus = false,
    this.clipBehavior = Clip.none,
    this.color,
    this.shadow,
    this.radius,
    this.focusNode,
    this.height = 50,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final shadowColor = color ?? theme.primaryColor;
    return Container(
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: radius ?? BorderRadius.circular(50.0),
        boxShadow: isLoading == true || onPressed == null
            ? null
            : [
                shadow ??
                    BoxShadow(
                      color: shadowColor.withAlpha(shadowColor.alpha ~/ 2),
                      blurRadius: 4,
                      offset: Offset(0.0, 3.0),
                    ),
              ],
      ),
      child: ElevatedButton(
        onPressed: isLoading == true ? null : onPressed,
        onLongPress: onLongPress,
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 100),
            child: isLoading == true
                ? SizedBox(
                    height: 24.0,
                    width: 24.0,
                    child: CircularProgressIndicator(
                      strokeWidth: 3.0,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : child,
          ),
        ),
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: radius ?? BorderRadius.circular(50.0),
            ),
          ),
          animationDuration: animationDuration,
          backgroundColor: MaterialStateProperty.all(color),
        ),
        focusNode: focusNode,
        autofocus: autofocus,
        clipBehavior: clipBehavior,
      ),
    );
  }
}
