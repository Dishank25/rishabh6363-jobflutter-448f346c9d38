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
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NjksImVtYWlsIjoibW11ZGdhbDY3QGdtYWlsLmNvbSIsInJvbGUiOiJDT01QQU5ZIiwiaWF0IjoxNzUyMDUzNDYwLCJleHAiOjE3NTIyMjYyNjB9.ZMXhoZJ0CK_a32sXxV9enWdzku6QoqcflMYBI4bALks";
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
