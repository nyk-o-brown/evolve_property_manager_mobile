import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiService {
  static const String baseUrl = 'https://your-backend-url.com/api';
  late Dio _dio;
  final _secureStorage = const FlutterSecureStorage();

  ApiService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        contentType: 'application/json',
      ),
    );

    // Add interceptors
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await _secureStorage.read(key: 'auth_token');
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
        onError: (error, handler) {
          if (error.response?.statusCode == 401) {
            // Handle token refresh or redirect to login
            print('Unauthorized - token may be expired');
          }
          return handler.next(error);
        },
      ),
    );
  }

  Future<Map<String, dynamic>> get(String endpoint) async {
    try {
      final response = await _dio.get(endpoint);
      return response.data is Map<String, dynamic>
          ? response.data
          : {'data': response.data};
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> post(
    String endpoint,
    Map<String, dynamic> data,
  ) async {
    try {
      final response = await _dio.post(endpoint, data: data);
      return response.data is Map<String, dynamic>
          ? response.data
          : {'data': response.data};
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> put(
    String endpoint,
    Map<String, dynamic> data,
  ) async {
    try {
      final response = await _dio.put(endpoint, data: data);
      return response.data is Map<String, dynamic>
          ? response.data
          : {'data': response.data};
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> delete(String endpoint) async {
    try {
      final response = await _dio.delete(endpoint);
      return response.data is Map<String, dynamic>
          ? response.data
          : {'data': response.data};
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> uploadFile(
    String endpoint,
    String filePath, {
    String fieldName = 'file',
    Map<String, dynamic>? additionalData,
  }) async {
    try {
      final formData = FormData.fromMap({
        fieldName: await MultipartFile.fromFile(filePath),
        if (additionalData != null) ...additionalData,
      });
      final response = await _dio.post(endpoint, data: formData);
      return response.data is Map<String, dynamic>
          ? response.data
          : {'data': response.data};
    } catch (e) {
      rethrow;
    }
  }

  Future<void> saveToken(String token) async {
    await _secureStorage.write(key: 'auth_token', value: token);
  }

  Future<String?> getToken() async {
    return await _secureStorage.read(key: 'auth_token');
  }

  Future<void> deleteToken() async {
    await _secureStorage.delete(key: 'auth_token');
  }

  void dispose() {
    _dio.close();
  }
}
