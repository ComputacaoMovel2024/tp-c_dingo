import 'package:flutter/material.dart';

import 'package:dingo/dart_classes_aux/custom_text_field.dart';

import 'dart:ui' as ui;

class PasswordRecoveryPage extends StatefulWidget {
  const PasswordRecoveryPage({super.key});

  @override
  State<PasswordRecoveryPage> createState() => _PasswordRecoveryPageState();
}

class _PasswordRecoveryPageState extends State<PasswordRecoveryPage> {
  late TextEditingController _emailController;
  bool _showCustomText = false;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
  }

  void _addCustomText() {
    setState(() {
      _showCustomText = true;
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
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
                title: const Text(
                  'Forgot Password?',
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
                        'To recover your password',
                        style: TextStyle(fontSize: 20),
                      ),
                      const Text(
                        'please type your email here',
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 25),
                      CustomTextField(
                        placeholderText: 'Email',
                        isObscure: false,
                        customPrefixIcon: const Icon(Icons.email),
                        controller: _emailController, // Pass the controller here
                      ),
                      const SizedBox(height: 25),
                      ElevatedButton(
                        onPressed: _addCustomText,
                        style: ElevatedButton.styleFrom(
                          elevation: 5,
                          backgroundColor: const Color.fromARGB(254, 66, 254, 157),
                          padding: const EdgeInsets.fromLTRB(45, 5, 45, 5),
                        ),
                        child: const Text('Send'),
                      ),
                      if (_showCustomText)
                        _emailController.text.isNotEmpty
                          ? const Text(
                              'An email has been sent',
                              style: TextStyle(fontSize: 16),
                            )
                          : const Text(
                              'Please type a valid email',
                              style: TextStyle(fontSize: 16),
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