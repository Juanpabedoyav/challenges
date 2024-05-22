import 'package:challenge1/features/shares/data/datasources/shares_data_source_impl.dart';
import 'package:challenge1/features/shares/domain/models/shares.dart';
import 'package:challenge1/features/shares/domain/repositories/share_repository.dart';

class ShareRepositoryImpl implements SharesRepository {
  final SharesDataSourceImpl dataSourceImpl;

  ShareRepositoryImpl({required this.dataSourceImpl});
  @override
  Future<SharesData> getShares() async {
    final sharesData = await dataSourceImpl.getShares();
    return sharesData;
  }
}
