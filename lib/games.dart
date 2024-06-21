import 'package:flutter/material.dart';
import 'header.dart';

class Games extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background_games.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}