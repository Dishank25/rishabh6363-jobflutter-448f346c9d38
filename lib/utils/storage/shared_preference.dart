import 'dart:convert';
import 'package:job_portal/views/detailed_signup/presentation/bloc/skill_bloc/skill_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesManager {
  // keys for storing data
  static const TOKEN = "token";
  static const USER_ID = "userId";
  static const SKILL_PARAMS = "skill_params";

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

  Future<void> setUserId(String userId) async {
    await _prefs.setString(USER_ID, userId);
  }

  String? getUserId() {
    return _prefs.getString(USER_ID);
  }

  Future<void> setSkillParams(Map<String, dynamic> skillParams) async {
    final skillInString = jsonEncode(skillParams);
    await _prefs.setString(SKILL_PARAMS, skillInString);
  }

  String? getSkillParams() {
    return _prefs.getString(SKILL_PARAMS);
  }
}
