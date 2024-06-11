import 'package:flutter/material.dart';

import 'package:dingo/dart_classes_aux/custom_slider.dart';

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
              child: Image.asset('lib/assets/background_image.png', fit: BoxFit.cover),
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
                        customIconPath: 'lib/assets/music_note_icon.png',
                        preferenceKey: 'musicNoteSliderValue', //chave para as Shared Preferences
                      ),
                      const CustomSlider(
                        customIconPath: 'lib/assets/speaker_icon.png',
                        preferenceKey: 'speakerSliderValue', //chave para as Shared Preferences
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
                        onButtonPressed: () {},
                      ),
                      const SizedBox(height: 5),
                      CustomSettingsButton(
                        settingsIcon: const Icon(Icons.language, size: 30), 
                        settingsText: 'Change Language',
                        onButtonPressed: () {},
                      ),
                      const SizedBox(height: 5),
                      CustomSettingsButton(
                        settingsIcon: const Icon(Icons.lock, size: 30), 
                        settingsText: 'Privacy Settings',
                        onButtonPressed: () {},
                      ),
                      const SizedBox(height: 5),
                      CustomSettingsButton(
                        settingsIcon: const Icon(Icons.headset_mic, size: 30), 
                        settingsText: 'Help & Support',
                        onButtonPressed: () {},
                      ),
                      const SizedBox(height: 5),
                      CustomSettingsButton(
                        settingsIcon: const Icon(Icons.info, size: 30), 
                        settingsText: 'Info & Credits',
                        onButtonPressed: () {},
                      ),
                      const SizedBox(height: 5),
                      const Divider(
                        thickness: 1.5,
                        color: Colors.black,
                        indent: 40,
                        endIndent: 40,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: 300,
                          height: 60,
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0, 3),
                                blurRadius: 2.0
                              ),
                            ],
                            color: const Color.fromARGB(255, 247, 105, 138),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Center(
                            child: Text(
                              'Logout',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: 300,
                          height: 60,
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0, 3),
                                blurRadius: 2.0
                              ),
                            ],
                            color: const Color.fromARGB(255, 255, 53, 100),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Center(
                            child: Text(
                              'Close Application',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                              ),
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

class CustomSettingsButton extends StatelessWidget {
  final Icon settingsIcon;
  final String settingsText;
  final VoidCallback? onButtonPressed;

  const CustomSettingsButton({
    super.key,
    required this.settingsIcon,
    required this.settingsText,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
              blurRadius: 2.0
            ),
          ],
          color: const Color.fromARGB(255, 202, 231, 255),
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
    );
  }
}