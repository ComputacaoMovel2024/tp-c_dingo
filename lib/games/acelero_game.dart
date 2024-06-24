import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:math';

class AceleroGame extends StatefulWidget {
  @override
  _AceleroGameState createState() => _AceleroGameState();
}

class _AceleroGameState extends State<AceleroGame> {
  double _x = 0.0, _y = 0.0, _z = 0.0;
  DateTime _lastShakeTime = DateTime.now().subtract(Duration(days: 1));
  int _coins = 0;
  bool _canShake = true;
  late SharedPreferences _prefs;
  late StreamSubscription<AccelerometerEvent> _subscription;

  @override
  void initState() {
    super.initState();
    _loadPrefs();
    _subscription = accelerometerEvents.listen((AccelerometerEvent event) {
      setState(() {
        _x = event.x;
        _y = event.y;
        _z = event.z;
      });
      _checkShake();
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  void _loadPrefs() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      _lastShakeTime = DateTime.fromMillisecondsSinceEpoch(
          _prefs.getInt('lastShakeTime') ?? DateTime.now().subtract(Duration(days: 1)).millisecondsSinceEpoch);
      _coins = _prefs.getInt('coins') ?? 0;
      _canShake = DateTime.now().difference(_lastShakeTime).inHours >= 24;
    });
  }

  void _checkShake() {
    double shakeThreshold = 50.0; // Ajuste o valor conforme necessário
    double acceleration = sqrt(_x * _x + _y * _y + _z * _z);
    if (acceleration > shakeThreshold && _canShake) {
      DateTime now = DateTime.now();
      if (now.difference(_lastShakeTime).inHours >= 24) {
        setState(() {
          _lastShakeTime = now;
          _coins += 10; // Ganhar 10 moedas
          _canShake = false;
        });
        _prefs.setInt('lastShakeTime', now.millisecondsSinceEpoch);
        _prefs.setInt('coins', _coins);
        _showCoins();
      } else {
        _showTimeRemaining();
      }
    }
  }

  void _showCoins() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Você ganhou 10 moedas!'),
      ),
    );
  }

  void _showTimeRemaining() {
    Duration timeRemaining = Duration(hours: 24) - DateTime.now().difference(_lastShakeTime);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Faltam ${timeRemaining.inHours} horas, ${timeRemaining.inMinutes % 60} minutos e ${timeRemaining.inSeconds % 60} segundos até poderes agitar novamente!'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/background.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            errorBuilder: (context, error, stackTrace) {
              print('Erro ao carregar a imagem de fundo: $error');
              return Center(child: Text('Erro ao carregar a imagem de fundo'));
            },
          ),
          Positioned(
            top: 40,
            left: 10,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white, size: 30),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/avatar.png',
                  width: 200,
                  height: 200,
                  errorBuilder: (context, error, stackTrace) {
                    print('Erro ao carregar a imagem do personagem: $error');
                    return Center(child: Text('Erro ao carregar a imagem do personagem'));
                  },
                ),
                SizedBox(height: 20),
                _canShake
                    ? Text(
                        'Agita-me!',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      )
                    : Text(
                        'Faltam ${(Duration(hours: 24) - DateTime.now().difference(_lastShakeTime)).inHours} horas, '
                        '${(Duration(hours: 24) - DateTime.now().difference(_lastShakeTime)).inMinutes % 60} minutos e '
                        '${(Duration(hours: 24) - DateTime.now().difference(_lastShakeTime)).inSeconds % 60} segundos até poderes agitar novamente!',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
