import 'package:flutter/material.dart';
import 'header.dart';
import 'package:proximity_sensor/proximity_sensor.dart';
import 'package:audioplayers/audioplayers.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isNear = false;
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _initializeProximitySensor();
  }

  void _initializeProximitySensor() {
    ProximitySensor.events.listen((int event) {
      setState(() {
        _isNear = event > 0;
      });
      _playSound();
    });
  }

  void _playSound() async {
    await _audioPlayer.play(AssetSource('assets/images/sounds/alert_sound.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              _isNear ? "assets/images/black_background.png" : "assets/images/background_home.png"
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}