import 'package:flutter/material.dart';

class PasswordRecoveryPage extends StatelessWidget {
  const PasswordRecoveryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Back to login page'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}