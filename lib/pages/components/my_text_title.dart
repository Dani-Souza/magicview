import 'package:flutter/material.dart';

class MyTextTitle extends StatelessWidget {
  final String message;
  const MyTextTitle({required this.message, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      style: TextStyle(
        color: Theme.of(context).colorScheme.secondary,
        fontFamily: "Righteous",
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
