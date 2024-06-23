import 'package:flutter/material.dart';
import 'header.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background_home.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}