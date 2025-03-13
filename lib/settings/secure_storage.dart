import 'package:client/models/user_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageHelper {
  static final SecureStorageHelper _instance = SecureStorageHelper._internal();
  factory SecureStorageHelper() => _instance;

  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  SecureStorageHelper._internal();

  // Save data
  Future<void> write(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  // Read data
  Future<String?> read(String key) async {
    return await _storage.read(key: key);
  }

  // Delete specific key
  Future<void> delete(String key) async {
    await _storage.delete(key: key);
  }

  // Delete all stored data
  Future<void> clear() async {
    await _storage.deleteAll();
  }
}

class StorageKeys{
  String userKey = "user";
  String tokenKey = "token";
}



String? token;
User? user;