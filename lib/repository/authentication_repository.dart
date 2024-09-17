abstract class AuthenticationRepository {
  Future<void> clearSecureStorage();
  Future<void> login({required String email});
  Future<bool> hasPrivKey();
}
