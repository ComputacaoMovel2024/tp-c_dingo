import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shake Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ShakeGame(),
    );
  }
}

class ShakeGame extends StatefulWidget {
  @override
  _ShakeGameState createState() => _ShakeGameState();
}

class _ShakeGameState extends State<ShakeGame> {
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
          print("################################GANHASTE!!!!");
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
    // Mostrar as moedas na tela
    // Pode usar animação para adicionar um efeito visual
  }

  void _showTimeRemaining() {
    int hoursRemaining = 24 - DateTime.now().difference(_lastShakeTime).inHours;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Você deve esperar $hoursRemaining horas antes de jogar novamente.'),
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
          Center(
            child: Image.asset(
              'assets/images/avatar.png',
              width: 200,
              height: 200,
              errorBuilder: (context, error, stackTrace) {
                print('Erro ao carregar a imagem do personagem: $error');
                return Center(child: Text('Erro ao carregar a imagem do personagem'));
              },
            ),
          ),
        ],
      ),
    );
  }
}
