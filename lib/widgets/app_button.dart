import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPress;
  final Color? color;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;
  final OutlinedBorder? shape;

  const AppButton({
    required this.text,
    required this.onPress,
    this.color,
    this.textStyle,
    this.padding,
    this.shape,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? Colors.blue.shade700,
        padding: padding,
        shape: shape ?? RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4)
        ),
      ),
      child: Text(
        text,
        style: textStyle ?? Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: Colors.white
        ),
      ),
    );
  }
}