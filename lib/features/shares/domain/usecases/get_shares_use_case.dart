import 'package:challenge1/features/shares/data/models/share_model.dart';
import 'package:challenge1/features/shares/domain/repositories/share_repository.dart';

class GetSharesUseCase {
  final SharesRepository _repository;

  GetSharesUseCase(this._repository);

  Future<ShareModel> call() async {
    final shareList = await _repository.getShares();
    return shareList;
  }
}
