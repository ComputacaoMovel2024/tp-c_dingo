import 'package:flutter/material.dart';

import 'package:dingo/dart_classes_aux/name_text_field.dart';

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
              const Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 255, 233, 206),
                        minRadius: 35,
                        maxRadius: 40,
                        child: Text('DS', style: TextStyle(fontSize: 22)),
                      ),
                      SizedBox(height: 10),
                      NameTextField(preferenceKey: 'usernameValue',),
                      SizedBox(height: 20),
                      Text('Time Played: 00h00', style: TextStyle(fontSize: 20)),
                      SizedBox(height: 5),
                      Text('Accessories Bought: 0', style: TextStyle(fontSize: 20)),
                      SizedBox(height: 5),
                      Text('Minigames Played: 0', style: TextStyle(fontSize: 20)),
                      SizedBox(height: 20),
                      Divider(
                        thickness: 1.5,
                        color: Colors.black,
                        indent: 40,
                        endIndent: 40,
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