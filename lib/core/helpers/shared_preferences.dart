import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtils {
  static const String _bearerTokenKey = 'bearerToken';

  // Singleton pattern
  static final SharedPreferencesUtils _instance = SharedPreferencesUtils._internal();

  SharedPreferences? _preferences;

  factory SharedPreferencesUtils() {
    return _instance;
  }

  SharedPreferencesUtils._internal();

  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // Method to check if a token is stored
  Future<bool> isLogin() async {
    if (_preferences == null) await init();
    return _preferences?.getString(_bearerTokenKey)?.isNotEmpty ?? false;
  }

  // Method to save bearer token
  Future<void> setToken(String token) async {
    if (_preferences == null) await init();
    await _preferences?.setString(_bearerTokenKey, token);
  }

  // Method to clear bearer token
  Future<void> clearToken() async {
    if (_preferences == null) await init();
    await _preferences?.remove(_bearerTokenKey);
  }

  // Method to get bearer token
  Future<String?> getToken() async {
    if (_preferences == null) await init();
    return _preferences?.getString(_bearerTokenKey);
  }
}
