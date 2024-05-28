// ignore_for_file: constant_identifier_names

import 'dart:convert';
import 'package:challenge1/features/shares/domain/models/shares.dart';
import 'package:challenge1/features/shares/domain/repositories/share_repository.dart';
import 'package:http/http.dart' as http;

class ApiClientImpl implements SharesRepository {
  final client = http.Client();

  static const BASE_URL = 'https://api.twelvedata.com/forex_pairs?source=docs';

  @override
  Future<Shares> getShares() async {
    final response = await client.get(
      Uri.parse(BASE_URL),
    );

    if (response.statusCode == 200) {
      final responseBody = await jsonDecode(response.body);
      Shares shares = Shares.fromJson(responseBody);
      return shares;
    } else {
      return Shares(
        data: [],
        count: 0,
        status: 'error',
      );
    }
  }
}
