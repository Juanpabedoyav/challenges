import 'package:challenge1/features/shares/domain/models/shares.dart';
import 'package:challenge1/features/shares/domain/usecases/get_shares.dart';
import 'package:flutter/material.dart';

class SharesProvider extends ChangeNotifier {
  final GetShares getSharesUseCase;

  SharesProvider(this.getSharesUseCase);

  // Initial state
  SharesData? _shares;
  bool _isLoading = true;

  // Getters
  SharesData? get shares => _shares;
  bool get isLoading => _isLoading;

  // Async methods
  Future<void> fetchShares() async {
    final shares = await getSharesUseCase();
    _shares = shares;
    _isLoading = false;
    notifyListeners();
  }
}
