import 'package:shared_preferences/shared_preferences.dart';

class PreferencesManager {
  // keys for storing data
  static const TOKEN = "token";

  // Singleton instance
  static final PreferencesManager _instance = PreferencesManager._internal();

  // SharedPreference instance
  late final SharedPreferences _prefs;

  // Private constructor
  PreferencesManager._internal();

  // factory method to initialize the sharedpreference
  static Future<PreferencesManager> create(SharedPreferences prefs) async {
    _instance._prefs = prefs;
    return _instance;
  }

  Future<void> setToken(String tkn) async {
    await _prefs.setString(TOKEN, tkn);
  }

  String? getToken() {
    return _prefs.getString(TOKEN);
  }

  Future<void> clear(String key) async {
    await _prefs.remove(key);
  }
}
