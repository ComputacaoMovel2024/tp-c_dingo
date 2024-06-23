import 'package:flutter/material.dart';
import 'header.dart';
import 'map_screen.dart'; // Ensure you import the new map_screen.dart file

class Map extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(),
      body: MapScreen(),
    );
  }
}

