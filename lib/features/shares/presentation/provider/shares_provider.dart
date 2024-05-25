import 'package:challenge1/features/shares/domain/models/shares.dart';
import 'package:challenge1/features/shares/domain/usecases/get_shares.dart';
import 'package:flutter/material.dart';

enum SharesStatus { initial, loading, success, error }

class SharesProvider extends ChangeNotifier {
  SharesProvider(
      {
      required GetShares getShares,
      SharesStatus? initialStatus,
      List<Shares>? shares,
      })
      : _getShares = getShares,
        _status = initialStatus ?? SharesStatus.initial;
        _shares = shares ?? [];

  //Use cases
  final GetShares _getShares;
  //Properties
  SharesStatus _status;
  SharesStatus get status => _status;

  final List<Shares> _shares;
  List<Shares> get shares => List.unmodifiable(_shares);

  //actions
  Future<void> fetchShares() async {
    _status = SharesStatus.loading;
    notifyListeners();
    final sharesList = await _getShares();
    _shares.addAll(sharesList);
    _status = SharesStatus.success;
  }
}


