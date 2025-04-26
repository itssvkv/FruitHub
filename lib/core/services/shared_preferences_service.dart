
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static late SharedPreferences _instance;
  static Future<void> init() async {
    _instance = await SharedPreferences.getInstance();
  }

  static Future<void> setValue<T>(String key, T value) async {
    if (value is bool) {
      await _instance.setBool(key, value);
    } else if (value is int) {
      await _instance.setInt(key, value);
    } else if (value is double) {
      await _instance.setDouble(key, value);
    } else if (value is String) {
      await _instance.setString(key, value);
    } else {
      throw UnsupportedError('Type ${T.runtimeType} is not supported');
    }
  }

  static T getValue<T>(String key, T defaultValue) {
    final value = _instance.get(key);
    if (value is T) {
      return value;
    } else {
      return defaultValue;
    }
  }
}
