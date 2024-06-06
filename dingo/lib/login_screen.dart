

import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text('Introduce your username'),
            const CustomTextField(placeholderText: 'Username', isObscure: false,),
            const SizedBox(height: 50),
            const Text('Introduce your password'),
            const CustomTextField(placeholderText: 'Password', isObscure: true,),
            const SizedBox(height: 35),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Login'),
            ),
            const Text(
              'Forgot your password?',
              style: TextStyle(
                fontSize: 12,
                decoration: TextDecoration.underline,
              ),
            )
          ],
        ),
      )
    );
  }
}

class CustomTextField extends StatefulWidget {
  final String placeholderText;
  final bool isObscure;

  const CustomTextField({
    super.key,
    required this.placeholderText,
    required this.isObscure,
  });

  @override
  State<CustomTextField> createState() => _CustomTextField();
}

class _CustomTextField extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: TextField(
        autocorrect: false,
        obscureText: widget.isObscure,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: widget.placeholderText,
        ),
      ),
    );
  }
}