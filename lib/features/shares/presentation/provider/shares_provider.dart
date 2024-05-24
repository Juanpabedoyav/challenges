import 'package:challenge1/features/shares/domain/models/shares.dart';
import 'package:challenge1/features/shares/domain/usecases/get_shares.dart';
import 'package:flutter/material.dart';

class SharesProvider extends ChangeNotifier {
  final GetShares getSharesUseCase;

  SharesProvider(this.getSharesUseCase);

  // Initial state
  Shares? _shares;
  List<SharesValue> _sharesList = [];
  bool _isLoading = true;

  // Getters
  Shares? get shares => _shares;
  List<SharesValue> get sharesList => _sharesList;
  bool get isLoading => _isLoading;

  // Async methods
  Future<void> fetchShares() async {
    final shares = await getSharesUseCase();
    _shares = shares;
    _sharesList = shares.values;
    _isLoading = false;
    notifyListeners();
  }
}
