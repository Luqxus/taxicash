import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static SecureStorage? _instance;

  SecureStorage._(this._storage);

  factory SecureStorage() =>
      _instance ??= SecureStorage._(const FlutterSecureStorage());

  final FlutterSecureStorage _storage;
  static const String _uidKey = "UID";
  static const String _priKey = "PRIVKEY";

  Future<void> persist({required String uid, required String privKey}) async {
    await _storage.write(key: _uidKey, value: uid);
    await _storage.write(key: _priKey, value: privKey);
  }

  Future<bool> hasPrivKey() async {
    String? value = await _storage.read(key: _priKey);
    return value != null;
  }

  Future<String?> getPrivKey() async {
    return await _storage.read(key: _priKey);
  }

  Future<String?> getUID() async {
    return await _storage.read(key: _uidKey);
  }

  Future<void> deletePrivKey() async {
    await _storage.delete(key: _priKey);
  }

  Future<void> deleteUID() async {
    await _storage.delete(key: _uidKey);
  }

  Future<void> deleteAll() async {
    await _storage.deleteAll();
  }
}
