import 'package:challenge1/features/shares/data/datasources/network/api_client_impl.dart';
import 'package:challenge1/features/shares/domain/models/shares.dart';
import 'package:challenge1/features/shares/domain/repositories/share_repository.dart';

class ShareRepositoryImpl implements SharesRepository {
  final ApiClientImpl _apiClient;

  ShareRepositoryImpl({required ApiClientImpl apiClient})
      : _apiClient = apiClient;

  @override
  Future<Shares> getShares() async {
    final fetchList = await _apiClient.getShares();
    return fetchList;
  }
}
