import 'package:challenge1/features/shares/domain/models/shares.dart';
import 'package:challenge1/features/shares/domain/usecases/get_shares.dart';
import 'package:flutter/material.dart';

enum SharesStatus { initial, loading, success, error }

class SharesProvider extends ChangeNotifier {
  SharesProvider({
    required GetShares getShares,
    List<Datum>? shares,
    SharesStatus? initialStatus,
  })  : _getShares = getShares,
        _status = initialStatus ?? SharesStatus.initial;

  // Use cases
  final GetShares _getShares;

  // Properties
  SharesStatus _status;
  SharesStatus get status => _status;
  List<Datum> _shares = [];
  List<Datum> get shares => _shares;

  // Actions
  Future<void> fetchShares() async {
    _status = SharesStatus.loading;
    notifyListeners();

    final sharesList = await _getShares();
    final sharesData = sharesList.data;
    _shares = sharesData;
    _status = SharesStatus.success;
    notifyListeners();
  }
}
