import 'package:challenge1/core/utils/base_controller_states.dart';
import 'package:challenge1/features/shares/data/models/share_model.dart';
import 'package:challenge1/features/shares/data/repositories/share_repository_impl.dart';
import 'package:challenge1/features/shares/domain/usecases/get_shares_use_case.dart';
import 'package:flutter/material.dart';

class SharesController extends ChangeNotifier {
  late ShareModel _shares;
  BaseControllerStates _state = BaseControllerStates.initial;

  BaseControllerStates get baseControllerStates => _state;
  ShareModel? get shares => _shares;

  final GetSharesUseCase _getSharesUseCase =
      GetSharesUseCase(ShareRepositoryImpl());
  // Actions
  Future<void> fetchShares() async {
    _state = BaseControllerStates.loading;
    notifyListeners();

    _shares = await _getSharesUseCase.call();
    _state = BaseControllerStates.success;
    notifyListeners();
  }
}
