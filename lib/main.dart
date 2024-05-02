import 'package:flutter/material.dart';
import 'package:magicview/pages/home_pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MAGICVIEW',
      theme: ThemeData(
        fontFamily: 'Open Sans',
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          background: const Color(0xff21005D),
          secondary: Color(0xFFD0BCFF),
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
