import 'package:challenge1/core/utils/base_controller_states.dart';
import 'package:challenge1/features/shares/data/models/share_model.dart';
import 'package:challenge1/features/shares/domain/usecases/get_shares_use_case.dart';
import 'package:flutter/material.dart';

class SharesController extends ChangeNotifier {
  SharesController({
    required GetSharesUseCase getSharesUseCase,
    BaseControllerStates? initialState,
  })  : _getSharesUseCase = getSharesUseCase,
        _shares = ShareModel(pairs: {}),
        _status = initialState ?? BaseControllerStates.initial;

  //UseCase
  final GetSharesUseCase _getSharesUseCase;

  //Properties
  BaseControllerStates _status;
  BaseControllerStates get status => _status;

  ShareModel _shares;
  ShareModel get shares => _shares;

  //Actions
  Future<void> fetchShares() async {
    _status = BaseControllerStates.loading;
    notifyListeners();
    try {
      final list = await _getSharesUseCase.call();
      _shares = list;
      _status = BaseControllerStates.success;
      notifyListeners();
    } catch (e) {
      _status = BaseControllerStates.error;
    }
    notifyListeners();
  }
}
