import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sensors_plus/sensors_plus.dart';

class GyroGameScreen extends StatefulWidget {
  @override
  _GyroGameScreenState createState() => _GyroGameScreenState();
}

class _GyroGameScreenState extends State<GyroGameScreen> {
  double _playerPosition = 0;
  double _deviceWidth = 0;
  List<Widget> _fallingObjects = [];
  Timer? _timer;
  bool _isGameOver = false;
  int _score = 0;

  @override
  void initState() {
    super.initState();
    _initializeGame();
  }

  Future<void> _initializeGame() async {
    if (await Permission.sensors.request().isGranted) {
      gyroscopeEvents.listen((GyroscopeEvent event) {
        setState(() {
          _playerPosition -= event.z * 10;
          if (_playerPosition < 0) _playerPosition = 0;
          if (_playerPosition > _deviceWidth - 50) _playerPosition = _deviceWidth - 50;
          print("Gyroscope Event: ${event.z}, Player Position: $_playerPosition");
        });
      });

      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        if (!_isGameOver) {
          setState(() {
            _fallingObjects.add(_createFallingObject());
          });
        }
      });
    } else {
      print('Permissão para usar sensores não foi concedida');
    }
  }

  void _restartGame() {
    Navigator.pushReplacementNamed(context, '/');
  }

  void _exitGame() {
    SystemNavigator.pop();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Widget _createFallingObject() {
    double startX = Random().nextDouble() * _deviceWidth;
    bool isCoin = Random().nextBool();
    print("Creating ${isCoin ? 'coin' : 'enemy'} at $startX");
    return FallingObject(
      startX: startX,
      isCoin: isCoin,
      onCollision: (isCoin) {
        if (isCoin) {
          setState(() {
            _score += 1;
          });
        } else {
          setState(() {
            _isGameOver = true;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/background.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 20,
            left: _playerPosition,
            child: Image.asset(
              'assets/images/avatar.png',
              width: 50,
              height: 50,
            ),
          ),
          ..._fallingObjects,
          if (_isGameOver)
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Game Over\nScore: $_score',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30, color: Colors.red),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _restartGame,
                    child: Text('Jogar Novamente'),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _exitGame,
                    child: Text('Sair do Jogo'),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class FallingObject extends StatefulWidget {
  final double startX;
  final bool isCoin;
  final Function(bool) onCollision;

  FallingObject({required this.startX, required this.isCoin, required this.onCollision});

  @override
  _FallingObjectState createState() => _FallingObjectState();
}

class _FallingObjectState extends State<FallingObject> {
  double _positionY = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(milliseconds: 50), (timer) {
      setState(() {
        _positionY += 5;
      });
      if (_positionY > MediaQuery.of(context).size.height - 50 &&
          widget.startX >= _positionY && widget.startX <= _positionY + 50) {
        widget.onCollision(widget.isCoin);
        _timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: _positionY,
      left: widget.startX,
      child: widget.isCoin
          ? Image.asset('assets/images/coin.png', width: 30, height: 30)
          : Image.asset('assets/images/virus.png', width: 30, height: 30),
    );
  }
}
