import 'dart:convert';
import 'package:challenge1/features/shares/domain/models/shares.dart';
import 'package:challenge1/features/shares/domain/repositories/share_repository.dart';
import 'package:http/http.dart' as http;

class SharesDataSourceImpl implements SharesRepository {
  final http.Client client;

  SharesDataSourceImpl({required this.client});

  static const BASE_URL = 'https://ziff.p.rapidapi.com';
  static const API_KEY = '3039ed9becmsh30b3d62963b1ff4p1a6367jsnfe145e558f5a';

  @override
  Future<SharesData> getShares() async {
    final response = await client.get(
      Uri.parse("$BASE_URL/GBP/1.2345/2.5678"),
      headers: {
        'x-rapidapi-host': 'ziff.p.rapidapi.com',
        'x-rapidapi-key': API_KEY,
      },
    );

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      final data = responseBody as Map<String, dynamic>;
      final sharesData = SharesData.fromJson(data);
      return sharesData;
    } else {
      throw Exception('Invalid data format');
    }
  }
}
