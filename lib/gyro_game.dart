import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'header.dart';

class GyroGame extends StatelessWidget {
  const GyroGame({super.key});

  void main() {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
    ]);
  }

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