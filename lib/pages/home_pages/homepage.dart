
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:magicview/pages/home_pages/mySearch.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "MAGICVIEW ",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontFamily: "Righteous",
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              const Row(
                children: [
                  //executando a função da pagina mysearch
                 MySearch()
                ],
              )
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
