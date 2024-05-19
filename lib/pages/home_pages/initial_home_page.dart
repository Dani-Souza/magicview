import 'package:flutter/material.dart';
import 'package:magicview/app_routes.dart';

class InitialHomePage extends StatefulWidget {
  const InitialHomePage({super.key});

  @override
  State<InitialHomePage> createState() => _InitialHomePageState();
}

class _InitialHomePageState extends State<InitialHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff21005D),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.homePage);
                },
                child: Image.asset(
                  'assets/image/magicview.gif',
                  width: 336,
                  height: 171,
                ),
              ),
              Image.asset(
                'assets/image/logo.png',
                width: 369,
                height: 85,
              ),
            ],
          ),
        ),
      ),

      //<- place where the image appears
    );
  }
}
