import 'package:challenge1/features/shares/data/datasources/network/api_client.dart';
import 'package:challenge1/features/shares/data/models/share_model.dart';
import 'package:challenge1/features/shares/domain/repositories/share_repository.dart';

class ShareRepositoryImpl implements SharesRepository {
  final ApiClient _apiClient = ApiClient();

  @override
  Future<ShareModel> getShares() async {
    final fetchList = await _apiClient.getShares();
    return ShareModel.fromJson(fetchList);
  }
}
