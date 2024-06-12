import 'package:flutter/material.dart';
import 'dart:async';
import 'login_screen.dart';
import 'dart:ui' as ui;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    //Timer para se conseguir observar o Splash Screen
    //Poderá ser trocado mais tarde
    _timer = Timer(
      const Duration(seconds: 20),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _skipSplashScreen() {
    _timer?.cancel();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: ImageFiltered(
              imageFilter: ui.ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
              child: Image.asset('lib/assets/background_image.png', fit: BoxFit.cover),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 200,
                  height: 75,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(175, 33, 149, 243),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Center(
                    child: Text(
                      'Dingo',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 32,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                Image.asset(
                  'lib/assets/dingo.png',
                  height: 200,
                  width: 200,
                ),
                const SizedBox(height: 25),
                const SizedBox(
                  width: 75,
                  height: 75,
                  child: CircularProgressIndicator( //Feedback do loading da aplicação - Puramente estético por agora
                    color: Color.fromARGB(255, 0, 255, 8),
                    strokeWidth: 6,
                  ),
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: _skipSplashScreen,
                  child: const Text('Skip'), //Para debugging e para não esperar os 20 segundos
                ),
                Container(
                  width: 200,
                  height: 75,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(175, 33, 149, 243),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Center(
                    child: Text(
                      'Loading...',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 32,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
