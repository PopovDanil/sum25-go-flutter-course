import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';

class SecureStorageService {
  static const FlutterSecureStorage _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
    iOptions: IOSOptions(
        accessibility: KeychainAccessibility.first_unlock_this_device),
  );

  static const String _authTokenKey = 'auth_token';
  static const String _usernameKey = 'username';
  static const String _passwordKey = 'password';
  static const String _biometricKey = 'biometric_enabled';

  // Save authentication token
  static Future<void> saveAuthToken(String token) async {
    await _storage.write(key: _authTokenKey, value: token);
  }

  // Get authentication token
  static Future<String?> getAuthToken() async {
    return await _storage.read(key: _authTokenKey);
  }

  // Delete authentication token
  static Future<void> deleteAuthToken() async {
    await _storage.delete(key: _authTokenKey);
  }

  // Save user credentials
  static Future<void> saveUserCredentials(
      String username, String password) async {
    await _storage.write(key: _usernameKey, value: username);
    await _storage.write(key: _passwordKey, value: password);
  }

  // Get user credentials
  static Future<Map<String, String?>> getUserCredentials() async {
    final username = await _storage.read(key: _usernameKey);
    final password = await _storage.read(key: _passwordKey);
    return {'username': username, 'password': password};
  }

  // Delete user credentials
  static Future<void> deleteUserCredentials() async {
    await _storage.delete(key: _usernameKey);
    await _storage.delete(key: _passwordKey);
  }

  // Save biometric setting
  static Future<void> saveBiometricEnabled(bool enabled) async {
    await _storage.write(key: _biometricKey, value: enabled.toString());
  }

  // Get biometric setting
  static Future<bool> isBiometricEnabled() async {
    final value = await _storage.read(key: _biometricKey);
    return value?.toLowerCase() == 'true';
  }

  // Save any secure data
  static Future<void> saveSecureData(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  // Get secure data
  static Future<String?> getSecureData(String key) async {
    return await _storage.read(key: key);
  }

  // Delete secure data
  static Future<void> deleteSecureData(String key) async {
    await _storage.delete(key: key);
  }

  // Save object as JSON
  static Future<void> saveObject(
      String key, Map<String, dynamic> object) async {
    final jsonString = jsonEncode(object);
    await _storage.write(key: key, value: jsonString);
  }

  // Get object from JSON
  static Future<Map<String, dynamic>?> getObject(String key) async {
    final jsonString = await _storage.read(key: key);
    if (jsonString == null) return null;
    return jsonDecode(jsonString);
  }

  // Check if key exists
  static Future<bool> containsKey(String key) async {
    return await _storage.containsKey(key: key);
  }

  // Get all keys
  static Future<List<String>> getAllKeys() async {
    final all = await _storage.readAll();
    return all.keys.toList();
  }

  // Clear all secure data
  static Future<void> clearAll() async {
    await _storage.deleteAll();
  }

  // Export all key-value pairs (use with caution)
  static Future<Map<String, String>> exportData() async {
    return await _storage.readAll();
  }
}
