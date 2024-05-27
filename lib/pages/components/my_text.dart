import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String title;
  final double fontSize;
  const MyText({super.key, required this.title, this.fontSize = 12.0});

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.justify,
      title,
      style: TextStyle(
        color: Theme.of(context).colorScheme.secondary,
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
