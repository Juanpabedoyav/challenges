import 'dart:convert';
import 'package:challenge1/features/shares/domain/models/shares.dart';
import 'package:challenge1/features/shares/domain/repositories/share_repository.dart';
import 'package:http/http.dart' as http;

class SharesDataSourceImpl implements SharesRepository {
  final http.Client client;

  SharesDataSourceImpl({required this.client});

  static const BASE_URL =
      'https://api.twelvedata.com/time_series?symbol=COP/ARS,COP/VEF&interval=1month&apikey=86a190ff9310404fbbb5e2c9e0e74d8a';

  @override
  Future<Shares> getShares() async {
    final response = await client.get(
      Uri.parse(BASE_URL),
    );

    if (response.statusCode == 200) {
      try {
        final responseBody = json.decode(response.body);
        final sharesData = Shares.fromJson(responseBody);
        return sharesData;
      } catch (e) {
        throw Exception('Error parsing data: $e');
      }
    } else {
      throw Exception('Failed to load shares data: ${response.statusCode}');
    }
  }
}
