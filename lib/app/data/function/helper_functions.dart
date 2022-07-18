import 'package:shared_preferences/shared_preferences.dart';

class HelperFunction {
  static final String userNameKey = "USERNAMEKEY";
  static final String userEmailKey = "USEREMAILKEY";

  static Future<bool> saveUserName(String? userName) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setString(userNameKey, userName!);
  }

  static Future<bool> saveUserEmail(String userEmail) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setString(userEmailKey, userEmail);
  }

  static Future<String?> getUserName(String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final userName = sharedPreferences.getString(key);
    return userName;
  }

  static Future<String?> getUserEmail(String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(key);
  }
}
