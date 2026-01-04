import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorage {
  static const _tokenKey = 'access_token';
  static const _expirationKey = 'token_expiration';

  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  //Token storage kaydetme
  Future<void> saveToken(String token, DateTime expiration) async {
    await _storage.write(key: _tokenKey, value: token);
    await _storage.write(
        key: _expirationKey, value: expiration.toIso8601String());
  }

  //Token getirme
  Future<String?> getToken() => _storage.read(key: _tokenKey);
  //Token geçerlilik süresi getirme
  Future<DateTime?> getExpiration() async {
    final value = await _storage.read(key: _expirationKey);
    return value != null ? DateTime.parse(value) : null;
  }

  //storage verilerin silinmesi
  Future<void> clear() => _storage.deleteAll();
}
