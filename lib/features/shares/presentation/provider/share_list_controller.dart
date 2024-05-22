import 'package:challenge1/features/shares/domain/models/shares.dart';
import 'package:challenge1/features/shares/domain/repositories/share_repository.dart';
import 'package:flutter/material.dart';

class ShareListController extends ChangeNotifier {
  final SharesRepository _repository;

  ShareListController(this._repository);
  @override
  void onInit() {}

  Future<SharesData> getShares() async {
    final shares = await _repository.getShares();
    notifyListeners();
    return shares;
  }

  @override
  void refresh() {}

  @override
  void onRefresh() {}

  @override
  void onShare(SharesData share) {}

  @override
  void onDelete(SharesData share) {}

  @override
  void onEdit(SharesData share) {}
}
