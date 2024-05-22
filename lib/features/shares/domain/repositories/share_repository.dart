import 'package:challenge1/features/shares/domain/models/shares.dart';

abstract class SharesRepository {
  Future<SharesData> getShares();
}
