import 'package:shared_preferences/shared_preferences.dart';

class StorageHelper {

  static Future<String?> readData(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? value = preferences.getString(key);
    return value;
  }

  static Future<void> writeData(String key, String value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(key, value);
  }

}

enum StorageKeys {
  token,
  uid
}