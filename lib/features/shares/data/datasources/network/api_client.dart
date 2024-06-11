// ignore_for_file: constant_identifier_names

import 'package:challenge1/core/utils/base_api.dart';
import 'package:challenge1/features/shares/data/models/share_model.dart';

class ApiClient extends BaseApi {
  BaseApi apiClient = BaseApi();
  static const BASE_URL = 'https://ziff.p.rapidapi.com/exchangerates/COP';

  Future<ShareModel> getShares() async {
    final response = await apiClient.get(BASE_URL);
    return response.data;
  }
}
