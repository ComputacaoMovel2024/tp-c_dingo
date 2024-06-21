import 'package:flutter/material.dart';
import 'header.dart';

class GyroGame extends StatelessWidget {
  const GyroGame({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomHeader(),
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