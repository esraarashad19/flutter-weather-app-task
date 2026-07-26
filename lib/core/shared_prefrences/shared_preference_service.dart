import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  final SharedPreferences _preferences;

  const SharedPreferencesService(this._preferences,);

  Future<bool> setString(String key, String value) {
    return _preferences.setString(key, value,);
  }

  String? getString(String key) {
    return _preferences.getString(key,);
  }

  Future<bool> setBool(String key, bool value) {
    return _preferences.setBool(key, value);
  }

  bool? getBool(String key) {
    return _preferences.getBool(key);
  }

  Future<bool> setInt(String key, int value) {
    return _preferences.setInt(key, value);
  }

  int? getInt(String key,) {
    return _preferences.getInt(key);
  }

  Future<bool> setDouble(String key, double value) {
    return _preferences.setDouble(key, value);
  }

  double? getDouble(String key,) {
    return _preferences.getDouble(key);
  }

  Future<bool> remove(String key) {
    return _preferences.remove(key);
  }

  Future<bool> clear() {
    return _preferences.clear();
  }
}