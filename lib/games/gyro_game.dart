import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sensors_plus/sensors_plus.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
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
    // Solicitar permissão para usar os sensores
    //if (await Permission.sensors.request().isGranted) {
      // Iniciar escuta dos eventos do giroscópio
      /*gyroscopeEvents.listen((GyroscopeEvent event) {
        setState(() {
          _playerPosition -= event.y * 10;
          if (_playerPosition < 0) _playerPosition = 0;
          if (_playerPosition > _deviceWidth - 50) _playerPosition = _deviceWidth - 50;
          print("Gyroscope Event: ${event.y}, Player Position: $_playerPosition");
        });
      });*/

      // Iniciar timer para criar objetos que caem
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        if (!_isGameOver) {
          setState(() {
            _fallingObjects.add(_createFallingObject());
          });
        }
      });
    //} else {
      //print('Permissão para usar sensores não foi concedida');
    //}
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Widget _createFallingObject() {
    double startX = Random().nextDouble() * _deviceWidth; //não funciona, não sei porquê
    bool isCoin = Random().nextBool();
    print("Creating ${isCoin ? 'coin' : 'enemy'} at $startX");
    return Positioned(
      top: 0,
      left: startX,
      child: FallingObject(
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
      ),
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
            child: Container(
              width: 50,
              height: 50,
              color: Colors.blue,
            ),
          ),
          ..._fallingObjects,
          if (_isGameOver)
            Center(
              child: Text(
                'Game Over\nScore: $_score',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, color: Colors.red),
              ),
            ),
            Container(
              alignment: Alignment.topRight,
              margin: EdgeInsets.all(10.0),
              child: Text(
                "Score: $_score",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            )
        ],
      ),
    );
  }
}

class FallingObject extends StatefulWidget {
  final bool isCoin;
  final Function(bool) onCollision;

  FallingObject({required this.isCoin, required this.onCollision});

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
      if (_positionY > MediaQuery.of(context).size.height) {
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
      child: widget.isCoin
          ? Container(decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/coin.png"))),)
          : Container(decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/virus.png"))),),
          /*? Icon(Icons.attach_money, size: 30, color: Colors.yellow)
          : Icon(Icons.warning, size: 30, color: Colors.red),*/
    );
  }
}
