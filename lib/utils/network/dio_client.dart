import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio;

  DioClient(String baseUrl)
      : _dio = Dio(
          BaseOptions(
            baseUrl: baseUrl,
            connectTimeout: const Duration(seconds: 15),
            receiveTimeout: const Duration(seconds: 15),
            headers: {
              'Content-Type': 'application/json',
            },
          ),
        ) {
    // Add interceptor
    _dio.interceptors
        .add(LogInterceptor(requestBody: true, responseBody: true));

    // add more custom interceptors
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        // can add bearer token here
        String token =
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiZW1haWwiOiJqb2huZG9lQGV4YW1wbGUuY29tIiwicm9sZSI6IlNUVURFTlQiLCJpYXQiOjE3NTE4OTQwNTIsImV4cCI6MTc1MjA2Njg1Mn0.PgMnHWdVOD6LZZGT_9Q6ax5w5pObElw6HIQKY6u3dHk";
        options.headers.addAll({'Authorization': 'Bearer $token'});
        return handler.next(options);
      },
      onError: (DioException e, handler) {
        // can add global error handling here
        return handler.next(e);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
    ));
  }

  Dio get instance => _dio;
}
