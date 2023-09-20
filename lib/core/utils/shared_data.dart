import 'package:shared_preferences/shared_preferences.dart';

class SharedData {
  static SharedPreferences? prefs;

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static void saveToken({required String token}) async {
    await prefs?.setString('token', token);
  }

  static void saveFirst({required bool first}) async {
    await prefs?.setBool('first', first);
  }

  static String? getToken() {
    return prefs?.getString('token');
  }

  static bool? getFirst() {
    return prefs?.getBool('first');
  }
}
