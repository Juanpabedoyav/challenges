import 'dart:convert';
import 'package:challenge1/features/shares/domain/models/shares.dart';
import 'package:challenge1/features/shares/domain/repositories/share_repository.dart';
import 'package:http/http.dart' as http;

class ApiClientImpl implements SharesRepository {
  final client = http.Client();

  static const BASE_URL =
      'https://api.twelvedata.com/time_series?symbol=COP/ARS&interval=1month&apikey=86a190ff9310404fbbb5e2c9e0e74d8a';

  @override
  Future<List<Shares>> getShares() async {
    final response = await client.get(
      Uri.parse(BASE_URL),
    );

    try {
      final responseBody = json.decode(response.body);
      final result = responseBody.map((e) => Shares.fromJson(e)).toList();
      print(result);
      return result;
    } catch (e) {
      if (response.statusCode == 404) return [];
      throw Exception('Error parsing data: $e');
    }
  }
}
