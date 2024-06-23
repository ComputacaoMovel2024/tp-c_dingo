import 'package:flutter/material.dart';
import 'header.dart';

class Workshop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background_workshop.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

