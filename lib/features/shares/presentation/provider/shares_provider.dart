import 'package:challenge1/features/shares/domain/usecases/get_shares.dart';
import 'package:flutter/material.dart';

enum SharesStatus { initial, loading, success, error }

class SharesProvider extends ChangeNotifier {
  SharesProvider({
    required GetShares getShares,
    SharesStatus? initialStatus,
  })  : _getShares = getShares,
        _status = initialStatus ?? SharesStatus.initial;

  // Use cases
  final GetShares _getShares;

  // Properties
  SharesStatus _status;
  SharesStatus get status => _status;

  // Actions
  Future<void> fetchShares() async {
    _status = SharesStatus.loading;
    notifyListeners();

    final sharesList = await _getShares();
    print(sharesList);
    _status = SharesStatus.success;
    notifyListeners();
  }
}
