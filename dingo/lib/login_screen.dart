import 'package:flutter/material.dart';
import 'password_recovery_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w900,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text(
              'Welcome to Dingo!',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 35),
            const Text('Introduce your username'),
            const CustomTextField(placeholderText: 'Username', isObscure: false,),
            const SizedBox(height: 35),
            const Text('Introduce your password'),
            const CustomTextField(placeholderText: 'Password', isObscure: true,),
            const SizedBox(height: 35),
            ElevatedButton(
              onPressed: () {},
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
                ),
              )
            ),
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
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: TextField(
        controller: _controller,
        autocorrect: false,
        obscureText: widget.isObscure,
        decoration: InputDecoration(
          prefixIcon: !widget.isObscure
              ? const Icon(Icons.person)
              : const Icon(Icons.key),
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              _controller.clear();
            },
          ),
          border: const OutlineInputBorder(),
          labelText: widget.placeholderText,
        ),
      ),
    );
  }
}