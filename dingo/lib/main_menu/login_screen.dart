import 'package:flutter/material.dart';
import 'package:dingo/dart_classes_aux/custom_text_field.dart';

import 'password_recovery_screen.dart';
import 'main_screen_placeholder.dart';

import 'dart:ui' as ui;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void onLoginTap(BuildContext context) {
    _usernameController.clear();
    _passwordController.clear();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MainScreenPlaceholder()),
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
          Column(
            children: [
              AppBar(
                automaticallyImplyLeading: false,
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
                      CustomTextField(
                        placeholderText: 'Username',
                        isObscure: false,
                        customPrefixIcon: const Icon(Icons.person),
                        controller: _usernameController,
                      ),
                      const SizedBox(height: 20),
                      const Text('Introduce your password', style: TextStyle(fontSize: 20)),
                      const SizedBox(height: 5),
                      CustomTextField(
                        placeholderText: 'Password',
                        isObscure: true,
                        customPrefixIcon: const Icon(Icons.key),
                        controller: _passwordController,
                      ),
                      const SizedBox(height: 5),
                      Center(
                        child: Container(
                          width: 200,
                          height: 60,
                          margin: const EdgeInsets.all(5),
                          child: ElevatedButton.icon(
                            onPressed: () {
                              onLoginTap(context);
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 5,
                              backgroundColor: Colors.white,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero),
                            ),
                            icon: Image.asset('lib/assets/google_icon.png'),
                            label: const Text(
                              'Login with Google',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          onLoginTap(context);
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 5,
                          backgroundColor: const Color.fromARGB(254, 66, 254, 157),
                          padding: const EdgeInsets.fromLTRB(45, 5, 45, 5),
                        ),
                        child: const Text('Login'),
                      ),
                      const SizedBox(height: 5),
                      GestureDetector(
                        onTap: () {
                          _usernameController.clear();
                          _passwordController.clear();
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const PasswordRecoveryPage()),
                          );
                        },
                        child: const Text(
                          'Forgot your password?',
                          style: TextStyle(
                            fontSize: 12,
                            decoration: TextDecoration.underline,
                            color: Color.fromARGB(255, 0, 33, 60),
                          ),
                        ),
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