import 'package:challenge1/features/shares/domain/models/shares.dart';
import 'package:challenge1/features/shares/domain/repositories/share_repository.dart';

class GetShares {
  final SharesRepository repository;

  GetShares(this.repository);

  Future<Shares> call() async {
    return await repository.getShares();
  }
}
