// ignore_for_file: constant_identifier_names

import 'package:challenge1/core/exception/custom_exception.dart';
import 'package:challenge1/core/utils/base_api.dart';
import 'package:dio/dio.dart';

class ApiClient extends BaseApi {
  BaseApi apiClient = BaseApi();
  static const BASE_URL = 'https://ziff.p.rapidapi.com/exchangerates/COP';

  Future<Map<String, dynamic>> getShares() async {
    try {
      final response = await apiClient.get(BASE_URL,
          options: Options(
            headers: {
              'x-rapidapi-host': 'ziff.p.rapidapi.com',
              'x-rapidapi-key':
                  '51b8f15250msh9c9ce8084b39f5bp196f98jsnce2b491c98b8',
            },
          ));
      return response.data['data'];
    } on DioException catch (e) {
      throw CustomException(
        messageUser: 'Error Se daño esta mierda',
        internalErrorCode: '500',
        internalErrorMessage: 'Error',
        stackTrace: e.stackTrace,
        data: e.response?.data,
        httpErrorCode: e.response?.statusCode,
      );
    }
  }
}
