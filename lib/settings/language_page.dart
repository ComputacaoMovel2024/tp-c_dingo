import 'package:flutter/material.dart';

import 'package:dingo/dart_classes_aux/custom_language_button.dart';
import 'package:dingo/dart_classes_aux/shared_preferences_manager.dart';

import 'dart:ui' as ui;

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  final SharedPreferencesManager _prefsManager = SharedPreferencesManager();
  String _selectedLanguageKey = '';

  @override
  void initState() {
    super.initState();
    _loadSelectedLanguage();
  }

  //Carregar os valores armazenados nas Shared Preferences
  Future<void> _loadSelectedLanguage() async {
    await _prefsManager.init(); //Verificar que as SharedPreferences estão inicializadas
    setState(() {
      _selectedLanguageKey = _prefsManager.getString('selected_language', '');
    });
  }

  //Salvar os valores do Username nas SharedPreferences
  Future<void> _saveSelectedLanguage(String preferenceKey) async {
    await _prefsManager.setString('selected_language', preferenceKey);
  }

  //Quando uma das linguagens é selecionada
  void _onLanguageSelected(String preferenceKey) {
    setState(() {
      _selectedLanguageKey = preferenceKey;
    });
    _saveSelectedLanguage(preferenceKey);
  }

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
                  'Language',
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
                      CustomLanguageButton(
                        languageIcon: 'assets/images/portugal_flag.png',
                        languageText: 'Português',
                        preferenceKey: 'portuguese',
                        isSelected: _selectedLanguageKey == 'portuguese',
                        onSelected: () => _onLanguageSelected('portuguese'),
                      ),
                      CustomLanguageButton(
                        languageIcon: 'assets/images/usa_flag.png',
                        languageText: 'English',
                        preferenceKey: 'english',
                        isSelected: _selectedLanguageKey == 'english',
                        onSelected: () => _onLanguageSelected('english'),
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