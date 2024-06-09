import 'package:flutter/material.dart';

class MainScreenPlaceholder extends StatelessWidget {
  const MainScreenPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Menu'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {},
              child: const Text('Settings'),
            ),
            ElevatedButton(
              onPressed: () { Navigator.pop(context); },
              child: const Text('Go back'),
            ),
          ],
        ),
      ),  
    );
  }
}