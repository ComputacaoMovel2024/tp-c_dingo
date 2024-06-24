import 'package:dingo/games/acelero_game.dart';
import 'package:dingo/games/gyro_game.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'workshop.dart';
import 'games/games.dart';
import 'closet.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Home(),
    Workshop(),
    Games(),
    Closet(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: '/',
      routes: {
        '/games': (context) => Games(),
        '/games/gyro_game': (context) => GyroGameScreen(),
        '/games/acelero_game': (context) => AceleroGame(),
      },
      home: Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.teal,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.precision_manufacturing),
              label: 'Workshop',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.games),
              label: 'Games',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.door_back_door),
              label: 'Closet',
            ),
          ],
        ),
      ),
    );
  }
}