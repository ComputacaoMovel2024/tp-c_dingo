import 'package:flutter/material.dart';
import 'package:dingo/dart_classes_aux/shared_preferences_manager.dart';

class CustomToggle extends StatefulWidget {
  final String text;
  final String preferenceKey;

  const CustomToggle({
    super.key,
    required this.text,
    required this.preferenceKey,
  });

  @override
  State<CustomToggle> createState() => _CustomToggleState();
}

class _CustomToggleState extends State<CustomToggle> {
  bool _value = true;
  late SharedPreferencesManager _prefsManager;

  final thumbIcon = WidgetStateProperty.resolveWith<Icon?>(
    (Set<WidgetState> states) {
      if (states.contains(WidgetState.selected)) {
        return const Icon(Icons.check);
      }
      return const Icon(Icons.close);
    },
  );

  @override
  void initState() {
    super.initState();
    _prefsManager = SharedPreferencesManager();
    _loadSwitchValue();
  }

  Future<void> _loadSwitchValue() async {
    await _prefsManager.init();
    setState(() {
      _value = _prefsManager.getBool(widget.preferenceKey, true);
    });
  }

  Future<void> _saveSwitchValue(bool value) async {
    await _prefsManager.setBool(widget.preferenceKey, value);
  }

  void onSwitchPress(bool value) {
    setState(() {
      _value = value;
      _saveSwitchValue(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            widget.text,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            textAlign: TextAlign.justify,
          ),
        ),
        const SizedBox(width: 30),
        Switch(
          thumbIcon: thumbIcon,
          value: _value,
          onChanged: onSwitchPress,
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}
