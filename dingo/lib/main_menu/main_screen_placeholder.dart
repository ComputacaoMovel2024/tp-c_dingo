import 'package:flutter/material.dart';

import '../settings/settings_page.dart';

class MainScreenPlaceholder extends StatelessWidget {
  const MainScreenPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Menu'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsPage())
                );
              },
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