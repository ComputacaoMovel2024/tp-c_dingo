import 'package:flutter/material.dart';

class CustomLanguageButton extends StatefulWidget {
  final String languageIcon;
  final String languageText;
  final String preferenceKey;
  final bool isSelected;
  final VoidCallback onSelected;

  const CustomLanguageButton({
    super.key,
    required this.languageIcon,
    required this.languageText,
    required this.preferenceKey,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  State<CustomLanguageButton> createState() => _CustomLanguageButtonState();
}

class _CustomLanguageButtonState extends State<CustomLanguageButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 450,
      height: 125,
      margin: const EdgeInsets.all(5),
      child: ElevatedButton(
        onPressed: widget.onSelected,
        style: ElevatedButton.styleFrom(
          elevation: 5,
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset(
              widget.languageIcon,
              width: 75,
              height: 50,
            ),
            const SizedBox(width: 30),
            Text(
              widget.languageText,
              style: const TextStyle(fontSize: 20, color: Colors.black),
            ),
            const SizedBox(width: 30),
            Theme(
              data: ThemeData(
                unselectedWidgetColor: Colors.grey, // Your color
              ),
              child: Transform.scale(
                scale: 1.5, // Make the checkbox bigger if needed
                child: Checkbox(
                  shape: const CircleBorder(),
                  value: widget.isSelected,
                  onChanged: (bool? value) {
                    widget.onSelected();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
