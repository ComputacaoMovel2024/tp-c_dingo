import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  SharedPreferences? _prefs;

  // Singleton pattern for SharedPreferencesManager
  static final SharedPreferencesManager _instance = SharedPreferencesManager._internal();
  
  factory SharedPreferencesManager() {
    return _instance;
  }

  SharedPreferencesManager._internal();

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  double getDouble(String key, double defaultValue) {
    return _prefs?.getDouble(key) ?? defaultValue;
  }

  Future<void> setDouble(String key, double value) async {
    await _prefs?.setDouble(key, value);
  }



  String getString(String key, String defaultValue) {
    return _prefs?.getString(key) ?? defaultValue;
  }

  Future<void> setString(String key, String value) async {
    await _prefs?.setString(key, value);
  }



  int getInt(String key, int defaultValue) {
    return _prefs?.getInt(key) ?? defaultValue;
  }

  Future<void> setInt(String key, int value) async {
    await _prefs?.setInt(key, value);
  }



  bool getBool(String key, bool defaultValue) {
    return _prefs?.getBool(key) ?? defaultValue;
  }

  Future<void> setBool(String key, bool value) async {
    await _prefs?.setBool(key, value);
  }

  Future<void> removeKey(String key) async {
    await _prefs?.remove(key);
  }
}