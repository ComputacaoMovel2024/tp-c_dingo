import 'package:flutter/material.dart';

import 'package:dingo/dart_classes_aux/name_text_field.dart';
import '../main_menu/login_screen.dart';

import 'dart:ui' as ui;

class ProfilePage extends StatefulWidget {

  const ProfilePage({
    super.key,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: ImageFiltered(
              imageFilter: ui.ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
              child: Image.asset('lib/assets/background_image.png', fit: BoxFit.cover),
            ),
          ),
          Column(
            children: <Widget>[
              AppBar(
                title: const Text(
                  'Profile',
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
                      const CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 255, 233, 206),
                        minRadius: 35,
                        maxRadius: 40,
                        child: Text('DS', style: TextStyle(fontSize: 22)),
                      ),
                      const SizedBox(height: 10),
                      const NameTextField(preferenceKey: 'usernameValue',),
                      const SizedBox(height: 20),
                      const Text('Time Played: 00h00', style: TextStyle(fontSize: 20)),
                      const SizedBox(height: 5),
                      const Text('Accessories Bought: 0', style: TextStyle(fontSize: 20)),
                      const SizedBox(height: 5),
                      const Text('Minigames Played: 0', style: TextStyle(fontSize: 20)),
                      const SizedBox(height: 5),
                      const Text('Steps Taken: 0', style: TextStyle(fontSize: 20)),
                      const SizedBox(height: 20),
                      const Divider(
                        thickness: 1.5,
                        color: Colors.black,
                        indent: 40,
                        endIndent: 40,
                      ),
                      const SizedBox(height: 20),
                      const Text('Linked Accounts', style: TextStyle(fontSize: 25)),
                      const SizedBox(height: 10),
                      Container(
                        width: 300,
                        height: 60,
                        margin: const EdgeInsets.all(5),
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            elevation: 5,
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          icon: Image.asset('lib/assets/google_icon.png'),
                          label: const Text(
                            'Link your account to your Google account',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ),
                      const SizedBox(height: 90),
                      Container(
                        width: 200,
                        height: 60,
                        margin: const EdgeInsets.all(5),
                        child: ElevatedButton(
                          onPressed: () async {
                            await showDialog(
                              context: context, 
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Delete Account?'),
                                  content: const Text(
                                    'Are you sure you wish to delete your account? This action is irreversible!'
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () { Navigator.pop(context); },
                                      child: const Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(builder: (context) => const LoginScreen())
                                        );
                                      },
                                      child: const Text('Confirm'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 5,
                            backgroundColor: const Color.fromARGB(255, 202, 231, 255),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Text(
                            'Delete Account', 
                            style: TextStyle(
                              fontSize: 18, 
                              fontWeight: FontWeight.w900,
                              color: Color.fromARGB(255, 255, 77, 77)
                            ),
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