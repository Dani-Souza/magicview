import 'package:flutter/material.dart';

class MySnackBar extends StatefulWidget {
  final String title;
  final double fontSize;
  const MySnackBar({super.key, required this.title, required this.fontSize});

  @override
  State<MySnackBar> createState() => _MySnackBarState();
}

class _MySnackBarState extends State<MySnackBar> {
  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: Text(
        textAlign: TextAlign.justify,
        widget.title,
        style: TextStyle(
          color: Theme.of(context).colorScheme.secondary,
          fontSize: widget.fontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      behavior: SnackBarBehavior.floating,
    );
  }
}
