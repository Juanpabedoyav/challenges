import 'package:challenge1/core/utils/base_interceptor.dart';
import 'package:dio/io.dart';

class BaseApi extends DioForNative {
  BaseApi() {
    interceptors.add((BaseInterceptors()));
  }
}
