import 'package:flutter/material.dart';

import 'package:dingo/dart_classes_aux/custom_slider.dart';
import 'package:dingo/dart_classes_aux/custom_button.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Image.asset(
              'lib/assets/background_image.png',
              fit: BoxFit.cover,
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
              const Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      CustomSlider(
                        customIconPath: 'lib/assets/music_note_icon.png',
                        preferenceKey: 'musicNoteSliderValue', //chave para as Shared Preferences
                      ),
                      CustomSlider(
                        customIconPath: 'lib/assets/speaker_icon.png',
                        preferenceKey: 'speakerSliderValue', //chave para as Shared Preferences
                      ),
                      Divider(
                        thickness: 1,
                        color: Colors.black,
                        indent: 40,
                        endIndent: 40,
                      ),
                      CustomSettingsButton(
                        settingsIcon: Icon(Icons.person, size: 30), 
                        settingsText: 'Edit Profile',
                      ),
                      SizedBox(height: 5),
                      CustomSettingsButton(
                        settingsIcon: Icon(Icons.language, size: 30), 
                        settingsText: 'Change Language',
                      ),
                      SizedBox(height: 5),
                      CustomSettingsButton(
                        settingsIcon: Icon(Icons.lock, size: 30), 
                        settingsText: 'Privacy Settings',
                      ),
                      SizedBox(height: 5),
                      CustomSettingsButton(
                        settingsIcon: Icon(Icons.headset_mic, size: 30), 
                        settingsText: 'Help & Support',
                      ),
                      SizedBox(height: 5),
                      CustomSettingsButton(
                        settingsIcon: Icon(Icons.info, size: 30), 
                        settingsText: 'Info & Credits',
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