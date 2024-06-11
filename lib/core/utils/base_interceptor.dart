import 'package:dio/dio.dart';

class BaseInterceptors extends Interceptor {
  @override
  // ignore: unnecessary_overrides
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);
  }

  @override
  // ignore: unnecessary_overrides
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    super.onError(err, handler);
  }
}
