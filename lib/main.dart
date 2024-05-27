import 'package:challenge1/app.dart';
import 'package:challenge1/features/shares/data/datasources/network/api_client_impl.dart';
import 'package:challenge1/features/shares/data/repositories/share_repository_impl.dart';
import 'package:challenge1/features/shares/domain/usecases/get_shares.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences sharedPref;
final api = ApiClientImpl();
final repo = ShareRepositoryImpl(apiClient: api);
GetShares getShares = GetShares(repository: repo);
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPref = await SharedPreferences.getInstance();
  runApp(MyApp(getShares: getShares));
}
