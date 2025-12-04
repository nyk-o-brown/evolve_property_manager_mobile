import '../../../data/services/api_service.dart';
import '../domain/user.dart';

class AuthRepository {
  final ApiService _apiService;

  AuthRepository(this._apiService);

  Future<User> login(String email, String password) async {
    final response = await _apiService.post('/login', {
      'email': email,
      'password': password,
    });

    final userData = response['user'] ?? response['data'];
    final user = User.fromJson(
      (userData is Map<String, dynamic> ? userData : {}) as Map<String, dynamic>,
    );
    final token = response['token'];

    if (token != null) {
      await _apiService.saveToken(token);
    }

    return user.copyWith(token: token);
  }

  Future<User> register(String name, String email, String password) async {
    final response = await _apiService.post('/register', {
      'name': name,
      'email': email,
      'password': password,
    });

    final userData = response['user'] ?? response['data'];
    final user = User.fromJson(
      (userData is Map<String, dynamic> ? userData : {}) as Map<String, dynamic>,
    );
    final token = response['token'];

    if (token != null) {
      await _apiService.saveToken(token);
    }

    return user.copyWith(token: token);
  }

  Future<void> logout() async {
    await _apiService.deleteToken();
  }

  Future<String?> getToken() async {
    return await _apiService.getToken();
  }
}
