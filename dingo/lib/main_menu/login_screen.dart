import 'package:flutter/material.dart';
import 'package:dingo/dart_classes_aux/custom_text_field.dart';

import 'password_recovery_screen.dart';
import 'main_screen_placeholder.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void onLoginTap(context) {
    Navigator.push(
      context, MaterialPageRoute(builder: (context) => const MainScreenPlaceholder()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill( //Encaixar a imagem de fundo no ecrã todo
            child: Image.asset(
              'lib/assets/background_image.png',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              AppBar(
                title: const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                centerTitle: true,
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text(
                        'Welcome to Dingo!',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 36,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Text(
                        'Your friendly computer!',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Image.asset(
                        'lib/assets/dingo.png',
                        height: 125,
                        width: 125,
                      ),
                      const SizedBox(height: 20),
                      const Text('Introduce your username', style: TextStyle(fontSize: 20)),
                      const SizedBox(height: 5),
                      const CustomTextField(
                        placeholderText: 'Username',
                        isObscure: false,
                        customPrefixIcon: Icon(Icons.person),
                      ),
                      const SizedBox(height: 20),
                      const Text('Introduce your password', style: TextStyle(fontSize: 20)),
                      const SizedBox(height: 5),
                      const CustomTextField(
                        placeholderText: 'Password',
                        isObscure: true,
                        customPrefixIcon: Icon(Icons.key),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 200,
                            height: 60,
                            margin: const EdgeInsets.all(5),
                            child: ElevatedButton.icon(
                              onPressed: () { onLoginTap(context); },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                padding: const EdgeInsets.all(0),
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero
                                ),
                              ),
                              icon: Image.asset('lib/assets/google_icon.png'),
                              label: const Text(
                                'Login with Google',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
                      ElevatedButton(
                        onPressed: () { onLoginTap(context); },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(254, 66, 254, 157), 
                          padding: const EdgeInsets.fromLTRB(45, 5, 45, 5),
                        ),
                        child: const Text('Login'),
                      ),
                      const SizedBox(height: 5),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context, MaterialPageRoute(builder: (context) => const PasswordRecoveryPage()),
                          );
                        },
                        child: const Text(
                          'Forgot your password?',
                          style: TextStyle(
                            fontSize: 12,
                            decoration: TextDecoration.underline,
                            color: Color.fromARGB(255, 0, 33, 60),
                          ),
                        )
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}