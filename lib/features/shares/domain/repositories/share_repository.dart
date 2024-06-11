import 'package:challenge1/features/shares/data/models/share_model.dart';

abstract class SharesRepository {
  Future<ShareModel> getShares();
}
