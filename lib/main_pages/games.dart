import 'package:flutter/material.dart';
import 'header.dart';
import 'acelero_game.dart'; // Importe a página do Jogo 1
import 'gyro_game.dart'; // Importe a página do Jogo 2

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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AceleroGame()),
                  );
                },
                child: Text('Play Acelero Game'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GyroGameScreen()),
                  );
                },
                child: Text('Play Gyro Game'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}