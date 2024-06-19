import 'package:flutter/material.dart';

import 'package:dingo/dart_classes_aux/custom_privacy_toggle.dart';

import 'dart:ui' as ui;

class PrivacyPage extends StatefulWidget {
  const PrivacyPage({super.key});

  @override
  State<PrivacyPage> createState() => _PrivacyPageState();
}

class _PrivacyPageState extends State<PrivacyPage> {
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
                  'Privacy',
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
                      CustomToggle(
                        text: 'Allow Dingo to access and send notifications',
                        preferenceKey: 'privacy_notification',
                      ),
                      SizedBox(height: 40),
                      CustomToggle(
                        text: 'Allow Dingo to access your location',
                        preferenceKey: 'privacy_location',
                      ),
                      SizedBox(height: 40),
                      CustomToggle(
                        text: 'Allow Dingo to access your camera',
                        preferenceKey: 'privacy_camera',
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
