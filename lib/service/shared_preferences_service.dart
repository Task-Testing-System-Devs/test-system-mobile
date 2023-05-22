import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static SharedPreferences? instance;

  static Future<void> init() async {
    instance = await SharedPreferences.getInstance();
  }

  String get token {
    return instance!.getString('user_token') ?? '';
  }

  set token(String value) {
    instance!.setString('user_token', value);
  }

  String get role {
    return instance!.getString('role') ?? '';
  }

  set role(String value) {
    instance!.setString('role', value);
  }
}
