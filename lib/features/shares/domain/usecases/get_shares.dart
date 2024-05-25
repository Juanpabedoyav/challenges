import 'package:challenge1/features/shares/domain/models/shares.dart';
import 'package:challenge1/features/shares/domain/repositories/share_repository.dart';

class GetShares {
  final SharesRepository _repository;

  GetShares({required SharesRepository repository}) : _repository = repository;

  Future<List<Shares>> call() async {
    final shareList = await _repository.getShares();
    return shareList;
  }
}
