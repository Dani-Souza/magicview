import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magicview/bloc/get_users/get_user_bloc.dart';
import 'package:magicview/pages/home_pages/homepage.dart';
import 'package:magicview/pages/user_page/list_user_page.dart';
import 'package:magicview/pages/user_page/my_favorites_page.dart';

class MyBottonNavigationBar extends StatefulWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const MyBottonNavigationBar(
      {super.key, required this.selectedIndex, required this.onItemTapped});

  @override
  State<MyBottonNavigationBar> createState() => _MyBottonNavigationBarState();
}

class _MyBottonNavigationBarState extends State<MyBottonNavigationBar> {
  int _selectedIndex = 0;
  final List<Widget> pages = [
    HomePage(),
    ListUserPage(),
    MyFavoritesPage(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // switch (index) {
      //   case 0:
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(builder: (context) => const HomePage()),
      //     );
      //     break;
      //   case 1:
      //     context.read<GetUserBloc>().add(GetUserEvent());
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(builder: (context) => const ListUserPage()),
      //     );
      //     break;
      //   case 2:
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(builder: (context) => const MyFavoritesPage()),
      //     );
      //     break;
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
        //  BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
      ],
      currentIndex: widget.selectedIndex,
      onTap: _onItemTapped,
    );
  }
}
