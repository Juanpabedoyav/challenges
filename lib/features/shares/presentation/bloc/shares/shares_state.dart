import 'package:challenge1/features/shares/domain/models/shares.dart';

abstract class SharesState {}

class FetchSharesInitial extends SharesState {}

class FetchSharesLoading extends SharesState {}

class FetchSharesLoaded extends SharesState {
  final SharesData shares;

  FetchSharesLoaded(this.shares);
}

class FetchSharesError extends SharesState {
  final String error;

  FetchSharesError(this.error);
}
