import 'package:flutter/material.dart';
import 'shared_preferences_manager.dart';  // Import the manager class

class NameTextField extends StatefulWidget {
  final String preferenceKey;

  const NameTextField({
    super.key,
    required this.preferenceKey,
  });

  @override
  State<NameTextField> createState() => _NameTextFieldState();
}

class _NameTextFieldState extends State<NameTextField> {
  late TextEditingController _controller;
  bool _isBeingEdited = false;
  final SharedPreferencesManager _prefsManager = SharedPreferencesManager();

  Future<void> _loadUsernameValue() async {
    await _prefsManager.init();
    setState(() {
      _controller.text = _prefsManager.getString(widget.preferenceKey, '');
    });
  }

  Future<void> _saveUsernameValue(String value) async {
    await _prefsManager.setString(widget.preferenceKey, value);
  }

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _loadUsernameValue();
    _controller.addListener(() {
      _saveUsernameValue(_controller.text);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void onButtonPressed() {
    setState(() {
      _isBeingEdited = !_isBeingEdited;
    });
  }

  void editingComplete() {
    setState(() {
      _isBeingEdited = false;
      _saveUsernameValue(_controller.text);
    });
  }

  void onNameDelete() {
    setState(() {
      _controller.clear();
      _saveUsernameValue('');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          onPressed: onButtonPressed,
          icon: const Icon(Icons.edit),
        ),
        SizedBox(
          width: 200,
          child: TextField(
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
            enabled: _isBeingEdited,
            controller: _controller,
            autocorrect: false,
            textAlign: TextAlign.center,
            onEditingComplete: editingComplete,
          ),
        ),
        IconButton(
          onPressed: onNameDelete,
          icon: const Icon(Icons.clear),
        ),
      ],
    );
  }
}
