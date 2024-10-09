import 'package:shared_preferences/shared_preferences.dart';

class PrefUtil {
  static late SharedPreferences preferences;
  static bool _init = false;

  static Future<void> init() async {
    if (_init) return;
    preferences = await SharedPreferences.getInstance();
    _init = true;
  }

  static void setValue(String key, Object value) {
    switch (value.runtimeType) {
      case String:
        preferences.setString(key, value as String);
        break;
      case bool:
        preferences.setBool(key, value as bool);
        break;
      case int:
        preferences.setInt(key, value as int);
        break;
      default:
        throw Exception('Unsupported value type');
    }
  }

  static Object getValue(String key, Object defaultValue, [Object? alterVal]) {
    switch (defaultValue.runtimeType) {
      case String:
        return preferences.getString(key) ?? (alterVal ?? defaultValue);
      case bool:
        return preferences.getBool(key) ?? (alterVal ?? defaultValue);
      case int:
        return preferences.getInt(key) ?? (alterVal ?? defaultValue);
      default:
        throw Exception('Unsupported default value type');
    }
  }
}