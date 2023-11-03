import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  late final SharedPreferences _prefs;
  Future<StorageService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setBool(String key, bool value) async =>
      await _prefs.setBool(key, value);

  Future<bool> setString(String key, String value) async =>
      _prefs.setString(key, value);

  bool getBool(String key) => _prefs.getBool(key) ?? true;

  bool getIsLoggedIn(String key) => _prefs.getString(key)==null?false:true;
}
