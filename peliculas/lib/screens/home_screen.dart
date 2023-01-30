import 'package:flutter/material.dart';
import 'package:peliculas/providers/movies.provider.dart';
import 'package:peliculas/screens/home_page.dart';
import 'package:peliculas/widgets/widgets.dart';
import 'package:provider/provider.dart';
import '../search/shearch_delegate.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

class Menu extends StatefulWidget {
  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int _currentIndex = 0;
  final List<Widget> pages = [
    HomePage(),
    Container(
      color: Colors.blue,
      child: Center(
        child: Text('beneficios'),
      ),
    ),
    Container(
      color: Colors.red,
      child: Center(
        child: Text('perfil'),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (index) => setState(() => _currentIndex = index),
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(Icons.apps),
            title: Text('Home'),
            activeColor: Colors.red,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.card_giftcard),
            title: Text('Benefinicios'),
            activeColor: Colors.purpleAccent,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.person),
            title: Text('Perfil'),
            activeColor: Colors.pink,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
