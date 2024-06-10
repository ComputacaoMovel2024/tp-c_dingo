import 'package:flutter/material.dart';

class CustomSettingsButton extends StatelessWidget {
  final Icon settingsIcon;
  final String settingsText;

  const CustomSettingsButton({
    super.key,
    required this.settingsIcon,
    required this.settingsText,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 300,
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
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