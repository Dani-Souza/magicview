import 'dart:io';

import 'package:flutter/material.dart';

class ListUserPage1 extends StatefulWidget {
  const ListUserPage1({super.key});

  @override
  State<ListUserPage1> createState() => _ListUserPageState();
}

class _ListUserPageState extends State<ListUserPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff21005D),
        bottomNavigationBar: BottomNavigationBar(
          //  type: BottomNavigationBarType.fixed,
          backgroundColor: Theme.of(context).colorScheme.secondary,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
            //  BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
          ],
        ),
        body: GridView.count(
          addRepaintBoundaries: true,
          childAspectRatio: .67,
          crossAxisCount: 4,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          padding: EdgeInsets.fromLTRB(0, 10, 2, 0),
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(1),
              child: Image.file(
                File(
                    "/data/data/com.example.magicview/app_flutter/27052024034733.png"),
                fit: BoxFit.fill,
                alignment: Alignment.center,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(1),
              child: Image.file(
                File(
                    "/data/data/com.example.magicview/app_flutter/27052024034733.png"),
                fit: BoxFit.fill,
                alignment: Alignment.center,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(1),
              child: Image.file(
                File(
                    "/data/data/com.example.magicview/app_flutter/31052024063401.png"),
                fit: BoxFit.fill,
                alignment: Alignment.center,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(1),
              child: Image.file(
                File(
                    "/data/data/com.example.magicview/app_flutter/31052024120211.png"),
                fit: BoxFit.fill,
                alignment: Alignment.center,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(1),
              child: Image.file(
                File(
                    "/data/data/com.example.magicview/app_flutter/31052024010302.png"),
                fit: BoxFit.fill,
                alignment: Alignment.center,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(1),
              child: Image.file(
                File(
                    "/data/data/com.example.magicview/app_flutter/29052024103511.png"),
                fit: BoxFit.fill,
                alignment: Alignment.center,
              ),
            ),
          ],
        )
        //<- place where the image appears
        );
  }
}
