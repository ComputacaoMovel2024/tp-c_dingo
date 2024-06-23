import 'package:flutter/material.dart';

import 'package:dingo/dart_classes_aux/custom_slider.dart';

import '../main_menu/login_screen.dart';

import 'profile_page.dart';
import 'language_page.dart';
import 'privacy_page.dart';
import 'support_page.dart';
import 'credits_page.dart';

import 'dart:ui' as ui;

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: ImageFiltered(
              imageFilter: ui.ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
              child: Image.asset('assets/images/background_image.png', fit: BoxFit.cover),
            ),
          ),
          Column(
            children: <Widget>[
              AppBar(
                title: const Text(
                  'Settings',
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
                      const CustomSlider(
                        customIconPath: 'assets/images/music_note_icon.png',
                        preferenceKey: 'musicNoteSliderValue',
                      ),
                      const CustomSlider(
                        customIconPath: 'assets/images/speaker_icon.png',
                        preferenceKey: 'speakerSliderValue',
                      ),
                      const Divider(
                        thickness: 1.5,
                        color: Colors.black,
                        indent: 40,
                        endIndent: 40,
                      ),
                      const SizedBox(height: 5),
                      CustomSettingsButton(
                        settingsIcon: const Icon(Icons.person, size: 30),
                        settingsText: 'Edit Profile',
                        backgroundColor: const Color.fromARGB(255, 202, 231, 255),
                        onButtonPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilePage()));
                        },
                      ),
                      const SizedBox(height: 5),
                      CustomSettingsButton(
                        settingsIcon: const Icon(Icons.language, size: 30),
                        settingsText: 'Change Language',
                        backgroundColor: const Color.fromARGB(255, 202, 231, 255),
                        onButtonPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const LanguagePage()));
                        },
                      ),
                      const SizedBox(height: 5),
                      CustomSettingsButton(
                        settingsIcon: const Icon(Icons.lock, size: 30),
                        settingsText: 'Privacy Settings',
                        backgroundColor: const Color.fromARGB(255, 202, 231, 255),
                        onButtonPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const PrivacyPage()));
                        },
                      ),
                      const SizedBox(height: 5),
                      CustomSettingsButton(
                        settingsIcon: const Icon(Icons.headset_mic, size: 30),
                        settingsText: 'Help & Support',
                        backgroundColor: const Color.fromARGB(255, 202, 231, 255),
                        onButtonPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const SupportPage()));
                        },
                      ),
                      const SizedBox(height: 5),
                      CustomSettingsButton(
                        settingsIcon: const Icon(Icons.info, size: 30),
                        settingsText: 'Info & Credits',
                        backgroundColor: const Color.fromARGB(255, 202, 231, 255),
                        onButtonPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const CreditsPage()));
                        },
                      ),
                      const SizedBox(height: 5),
                      const Divider(
                        thickness: 1.5,
                        color: Colors.black,
                        indent: 40,
                        endIndent: 40,
                      ),
                      CustomSettingsButton(
                        settingsIcon: const Icon(Icons.logout, size: 30),
                        settingsText: 'Logout',
                        backgroundColor: const Color.fromARGB(255, 255, 53, 100),
                        onButtonPressed: () async {
                          await showDialog(
                            context: context, 
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Logout?'),
                                content: const Text('Are you sure you wish to logout?'),
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
                      ),
                      const SizedBox(height: 5),
                      CustomSettingsButton(
                        settingsIcon: const Icon(Icons.close, size: 30),
                        settingsText: 'Close Application',
                        backgroundColor: const Color.fromARGB(255, 204, 11, 56),
                        onButtonPressed: () async {
                          await showDialog(
                            context: context, 
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Exit?'),
                                content: const Text('Are you sure you wish to exit the application?'),
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

class CustomSettingsButton extends StatelessWidget {
  final Icon settingsIcon;
  final String settingsText;
  final Color backgroundColor;
  final VoidCallback? onButtonPressed;

  const CustomSettingsButton({
    super.key,
    required this.settingsIcon,
    required this.settingsText,
    required this.backgroundColor,
    this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.transparent,
        borderRadius: BorderRadius.circular(30),
        onTap: onButtonPressed,
        child: Container(
          width: 300,
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 3),
                blurRadius: 2.0,
              ),
            ],
            color: backgroundColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              settingsIcon,
              const Spacer(),
              Center(
                child: Text(
                  settingsText,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_forward,
                size: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

