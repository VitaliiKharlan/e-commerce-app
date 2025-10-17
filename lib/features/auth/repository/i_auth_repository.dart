abstract class IAuthRepository {
  Future<Map<String, dynamic>> login(String username, String password);
}