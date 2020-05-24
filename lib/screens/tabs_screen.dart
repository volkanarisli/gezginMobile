import 'package:flutter/material.dart';
import './home_screen.dart';
import './map__screen.dart';
import './profile_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<TabsScreen> {
  final List<Map<String, Object>> _pages = [
    {'page': HomeScreen(), 'title': 'Home Screen'},
    {'page': MapScreen(), 'title': 'Map Screen'},
    {'page': ProfileScreen(), 'title': 'Profile Screen'}
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          currentIndex: _selectedPageIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                size: 30.0,
              ),
              title: SizedBox.shrink(),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.map,
                size: 30.0,
              ),
              title: SizedBox.shrink(),
            ),
            BottomNavigationBarItem(
              icon: CircleAvatar(
                radius: 15.0,
                backgroundImage: AssetImage('assets/images/pp.jpg'),
              ),
              title: SizedBox.shrink(),
            )
          ]),
    );
  }
}
