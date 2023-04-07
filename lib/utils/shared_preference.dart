import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtils {
  static final SharedPreferencesUtils _sharedPreferencesUtils =
      SharedPreferencesUtils._internal();
  static late SharedPreferences prefs;

  factory SharedPreferencesUtils() {
    return _sharedPreferencesUtils;
  }

  SharedPreferencesUtils._internal();

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<bool> addStringToSF(
      {required String key, required String value}) async {
    return await prefs.setString(key, value);
  }

  Future<bool> addIntToSF({required String key, required int value}) async {
    return await prefs.setInt(key, value);
  }

  Future<bool> addDoubleToSF(
      {required String key, required double value}) async {
    return await prefs.setDouble(key, value);
  }

  Future<bool> addBoolToSF({required String key, required bool value}) async {
    return await prefs.setBool(key, value);
  }

  Future<String?> getStringValuesSF(String key) async {
    String? stringValue = prefs.getString(key);
    return stringValue;
  }

  Future<bool> getBoolValuesSF(String key) async {
    bool? boolValue = prefs.getBool(key);
    return boolValue ?? false;
  }

  Future<int?> getIntValuesSF(String key) async {
    int? intValue = prefs.getInt(key);
    return intValue;
  }

  Future<double?> getDoubleValuesSF(String key) async {
    double? doubleValue = prefs.getDouble(key);
    return doubleValue;
  }
}
