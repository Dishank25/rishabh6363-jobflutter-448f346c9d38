import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio;

  DioClient(String baseUrl)
      : _dio = Dio(
          BaseOptions(
            // validateStatus: (status) {
            //   return status == 200 || status == 201 || status == 409;
            // },
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
