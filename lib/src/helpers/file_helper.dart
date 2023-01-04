import 'package:flutter/services.dart' show rootBundle;

class FileHelper {
  static Future<String> readFile(String path) async {
    String fileContent = await rootBundle.loadString(path);
    return fileContent;
  }
}
