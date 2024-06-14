import 'package:challenge1/features/shares/presentation/provider/navbar_controller.dart';
import 'package:challenge1/features/shares/presentation/provider/shares_controller.dart';
import 'package:get_it/get_it.dart';
import 'package:challenge1/core/utils/base_api.dart';
import 'package:challenge1/features/shares/data/repositories/share_repository_impl.dart';
import 'package:challenge1/features/shares/domain/repositories/share_repository.dart';
import 'package:challenge1/features/shares/domain/usecases/get_shares_use_case.dart';

final getIt = GetIt.instance;

void injectionContainer() {
  //data Layer
  getIt.registerSingleton(BaseApi());
  getIt.registerFactory<SharesRepository>(() => ShareRepositoryImpl());

  //domain Layer
  getIt.registerFactory<GetSharesUseCase>(
      () => GetSharesUseCase(GetIt.I<SharesRepository>()));

  //presentation Layer
  getIt.registerSingleton(
      () => SharesController(getSharesUseCase: GetIt.I<GetSharesUseCase>()));
  getIt.registerLazySingleton(() => NavbarController());
}
