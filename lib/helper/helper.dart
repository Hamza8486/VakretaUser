import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Helper {
  static String valueSharedPreferences = 'customer_id';

  // Write DATA
  static Future<bool> saveUserData(int value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setInt(valueSharedPreferences, value);
  }

  // Read Data
  static Future getUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt(valueSharedPreferences);
  }

  // Start SharedPreferences customs
  static Future prefSetString(key, value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setString(key, value);
  }

  static Future<String?> prefGetString(key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(key);
  }

  static Future prefSetInt(key, value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setInt(key, value);
  }

  static Future prefGetInt(key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt(key);
  }

  static getTime(String string) {
    final DateTime now = DateTime.parse(string);
    final DateFormat formatter = DateFormat('hh:mm a');
    final String formatted = formatter.format(now);
    return formatted;
  }
}
