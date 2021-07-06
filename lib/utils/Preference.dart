import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class Preference {
  Preference._();

  static Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  /// ----------------------------------------------------------
  /// Generic routine to fetch an application preference
  /// ----------------------------------------------------------
  static Future<String> getItem(String name) async {
    final SharedPreferences prefs = await _prefs;

    return prefs.getString(name) ?? '';
  }

  /// ----------------------------------------------------------
  /// Generic routine to saves an application preference
  /// ----------------------------------------------------------
  static Future<bool> setItem(String name, String value) async {
    final SharedPreferences prefs = await _prefs;

    return prefs.setString(name, value);
  }


  static Future<bool> setItemList(String name, List<String> value) async {
    final SharedPreferences prefs = await _prefs;

    return prefs.setStringList(name, value);
  }

  static Future<List<String>> getItemList(String name) async {
    final SharedPreferences prefs = await _prefs;

    return prefs.getStringList(name) ?? List<String>();
  }

  /// ----------------------------------------------------------
  /// Generic routine to check an application preference
  /// ----------------------------------------------------------
  static Future<bool> containsKey(String name) async {
    final SharedPreferences prefs = await _prefs;

    return prefs.containsKey(name);
  }

  /// ----------------------------------------------------------
  /// Generic routine to remove an application preference
  /// ----------------------------------------------------------
  static Future<bool> removeKey(String name) async {
    final SharedPreferences prefs = await _prefs;

    return prefs.remove(name);
  }

  static Future<Set<String>> getAll() async {
    final SharedPreferences prefs = await _prefs;

    return prefs.getKeys();
  }

  static Future<bool> clearAll() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.getKeys();
    for (String key in preferences.getKeys()) {
      if (key != "BASEURL") {
        preferences.remove(key);
      }
    }
    return true;
  }
}
