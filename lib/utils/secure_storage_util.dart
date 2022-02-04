import 'package:delivery_app/views/views.dart' show LoginView;
import 'package:flutter/material.dart' show BuildContext, Navigator;
import 'package:flutter_secure_storage/flutter_secure_storage.dart'
    show FlutterSecureStorage;

class SecureStorageUtil {
  static const storage = FlutterSecureStorage();

  static Future<String?> get(String key) async {
    return await storage.read(key: key);
  }

  static Future<void> set(String key, String value) async {
    await storage.write(
      key: key,
      value: value,
    );
  }

  static Future<void> delete(String key) async {
    await storage.delete(key: key);
  }

  static Future<void> logout(BuildContext context) async {
    await storage.delete(key: 'token');
    await storage.delete(key: 'user');
    await storage.delete(key: 'role');
    await storage.delete(key: 'isrole');
    Navigator.pushNamedAndRemoveUntil(
        context, LoginView.routerName, (_) => false);
  }
}
