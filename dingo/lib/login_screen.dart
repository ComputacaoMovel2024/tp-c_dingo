import 'package:flutter/material.dart';
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
            const Text('Introduce your username', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 5),
            const CustomTextField(placeholderText: 'Username', isObscure: false, customPrefixIcon: Icon(Icons.person),),
            const SizedBox(height: 20),
            const Text('Introduce your password', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 5),
            const CustomTextField(placeholderText: 'Password', isObscure: true, customPrefixIcon: Icon(Icons.key),),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 120,
                  height: 60,
                  margin: const EdgeInsets.all(5),
                  child: ElevatedButton.icon(
                    onPressed: () { onLoginTap(context); },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 239, 239, 239),
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
                Container(
                  width: 120,
                  height: 60,
                  margin: const EdgeInsets.all(5),
                  child: ElevatedButton.icon(
                    onPressed: () { onLoginTap(context); },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 203, 230, 254),
                      padding: const EdgeInsets.all(0),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero
                      ),
                    ),
                    icon: Image.asset('lib/assets/facebook_icon.png'),
                    label: const Text(
                      'Login with Facebook',
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
                  color: Colors.blue,
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
  final Icon customPrefixIcon;

  const CustomTextField({
    super.key,
    required this.placeholderText,
    required this.isObscure,
    required this.customPrefixIcon,
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
          prefixIcon: widget.customPrefixIcon,
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              FocusScope.of(context).requestFocus(FocusNode());
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