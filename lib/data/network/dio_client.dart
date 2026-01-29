import 'package:dio/dio.dart';
import 'api_client.dart';
import '../utils/secure_storage_helper.dart';

class DioClient {
  static const String baseUrl = 'https://dummyjson.com';

  static Dio createDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {'Content-Type': 'application/json'},
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await SecureStorageHelper.getToken();
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
        onResponse: (response, handler) => handler.next(response),
        onError: (error, handler) => handler.next(error),
      ),
    );

    return dio;
  }

  static ApiClient getApiClient() {
    return ApiClient(createDio(), baseUrl: baseUrl);
  }
}
