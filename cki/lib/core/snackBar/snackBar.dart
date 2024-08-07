import 'package:flutter/material.dart';

class CustomSnackbar {
  final String message;
  final Color backgroundColor;
  final TextStyle textStyle;
  final Duration duration;
  final SnackBarAction? action;

  CustomSnackbar({
    required this.message,
    this.backgroundColor = Colors.black,
    this.textStyle = const TextStyle(color: Colors.white),
    this.duration = const Duration(seconds: 4),
    this.action,
  });

  void show(BuildContext context) {
    final snackBar = SnackBar(
      content: SizedBox(
        height: 50,
        child: Center(
          child: Text(
            message,
            style: textStyle,
          ),
        ),
      ),
      backgroundColor: backgroundColor,
      duration: duration,
      action: action,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}