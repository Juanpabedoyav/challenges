import 'package:challenge1/features/shares/domain/usecases/get_shares.dart';
import 'package:challenge1/features/shares/presentation/bloc/shares/shares_event.dart';
import 'package:challenge1/features/shares/presentation/bloc/shares/shares_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SharesBloc extends Bloc<SharesEvent, SharesState> {
  final GetShares getShares;

  SharesBloc({required this.getShares}) : super(FetchSharesInitial()) {
    on<FetchShares>((event, emit) async {
      emit(FetchSharesLoading());
      final shares = await getShares();
      emit(FetchSharesLoaded(shares));
    });
  }
}
