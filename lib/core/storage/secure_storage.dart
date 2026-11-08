import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Encrypted key-value storage for tokens and sensitive data.
class SecureStorage {
  SecureStorage._();

  static final SecureStorage _instance = SecureStorage._();
  factory SecureStorage() => _instance;

  final FlutterSecureStorage _storage = FlutterSecureStorage(
    aOptions: const AndroidOptions(
      encryptedSharedPreferences: true,
    ),
    iOptions: const IOSOptions(),
  );

  Future<void> write(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  Future<String?> read(String key) async => _storage.read(key: key);

  Future<void> delete(String key) async => _storage.delete(key: key);

  Future<void> deleteAll() async => _storage.deleteAll();

  /// Read a value, returning [defaultValue] if absent.
  Future<String> readWithDefault(String key, String defaultValue) async {
    final v = await read(key);
    return v ?? defaultValue;
  }
}
