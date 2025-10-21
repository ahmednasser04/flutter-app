import 'package:dio/dio.dart';
import 'package:hive/hive.dart';


class DioHelper {
  static late Dio dio;
  static bool isRefreshing = false;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://3s4rmd3r-3000.uks1.devtunnels.ms',
        receiveDataWhenStatusError: true,
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );

    dio.interceptors.add(AuthInterceptor(dio));
  }

  static Future<Map<String, dynamic>> _getAuthHeaders() async {
    final authBox = Hive.box('authBox');
    final accessToken = authBox.get('accessToken');

    if (accessToken == null) return {};

    return {
      'Authorization': 'Bearer $accessToken',
    };
  }


  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
  }) async {
    final headers = await _getAuthHeaders();
    return await dio.post(url, data: data, queryParameters: query, options: Options(headers: headers));
  }


  static Future<Response> fetchData({required String url}) async {
    final headers = await _getAuthHeaders();
    return await dio.get(url, options: Options(headers: headers));
  }
}

class AuthInterceptor extends Interceptor {
  final Dio _dio;
  AuthInterceptor(this._dio);

  Future<void> _saveNewTokens(Map<String, dynamic> data) async {
    final authBox = Hive.box('authBox');
    await authBox.put('accessToken', data['tokens']['accessToken']);
    await authBox.put('refreshToken', data['tokens']['refreshToken']);
  }

  Future<String?> _performTokenRefresh(String refreshToken) async {
    try {
      final response = await _dio.post(
        'https://wekaya.onrender.com/auth/refresh-token',
        data: {'refreshToken': refreshToken},
      );

      if (response.statusCode == 200) {
        await _saveNewTokens(response.data);
        return response.data['tokens']['accessToken'];
      }
      return null;
    } catch (e) {
      final authBox = Hive.box('authBox');
      await authBox.clear();
      return null;
    }
  }


  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401 && !DioHelper.isRefreshing) {
      final authBox = Hive.box('authBox');
      final refreshToken = authBox.get('refreshToken');

      if (refreshToken != null) {
        try {
          DioHelper.isRefreshing = true;
          final newAccessToken = await _performTokenRefresh(refreshToken);
          DioHelper.isRefreshing = false;

          if (newAccessToken != null) {
            final requestOptions = err.requestOptions;
            requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';

            final response = await _dio.fetch(requestOptions);
            return handler.resolve(response);
          }
        } catch (e) {
          DioHelper.isRefreshing = false;
          return handler.next(err);
        }
      }
    }
    return handler.next(err);
  }
}