import 'package:flutter/material.dart';

import 'package:dingo/dart_classes_aux/shared_preferences_manager.dart';

class CustomSlider extends StatefulWidget {
  final String customIconPath;
  final String preferenceKey;

  const CustomSlider({
    super.key,
    required this.customIconPath,
    required this.preferenceKey,
  });

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  double _sliderCurrentValue = 50; //Valor default
  final SharedPreferencesManager _prefsManager = SharedPreferencesManager();

  @override
  void initState() {
    super.initState();
    _loadSliderValue();
  }

  //Carregar os valores armazenados nas Shared Preferences
  Future<void> _loadSliderValue() async {
    await _prefsManager.init(); // Verificar que as SharedPreferences estão inicializadas
    setState(() {
      _sliderCurrentValue = _prefsManager.getDouble(widget.preferenceKey, 50);
    });
  }

  //Salvar os valores dos sliders nas SharedPreferences
  Future<void> _saveSliderValue(double value) async {
    await _prefsManager.setDouble(widget.preferenceKey, value);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Flexible( //Flexible para o layout não gerar quando o slider/texto "mudam de tamanho"
          child: Image.asset(
            widget.customIconPath,
            width: 32,
            height: 32,
          ),
        ),
        Flexible(
          flex: 3,
          child: SizedBox(
            child: Slider(
              activeColor: const Color.fromARGB(255, 0, 154, 131),
              inactiveColor: const Color.fromARGB(255, 74, 153, 141),
              value: _sliderCurrentValue,
              max: 100,
              divisions: 10,
              onChanged: (value) {
                setState(() {
                  _sliderCurrentValue = value;
                });
                _saveSliderValue(value);
              },
            ),
          ),
        ),
        Flexible(
          child: Text(
            _sliderCurrentValue.round().toString(),
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}