import 'package:challenge1/features/shares/data/datasources/shares_data_source_impl.dart';
import 'package:challenge1/features/shares/data/repositories/share_repository_impl.dart';
import 'package:challenge1/features/shares/domain/repositories/share_repository.dart';
import 'package:challenge1/features/shares/domain/usecases/get_shares.dart';
import 'package:challenge1/features/shares/presentation/bloc/shares/shares_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final getIt = GetIt.instance;
void init() {
//bloc
  getIt.registerFactory(() => SharesBloc(getShares: getIt()));

  //use cases
  getIt.registerLazySingleton(() => GetShares(getIt()));

  // Repositories
  getIt.registerLazySingleton<SharesRepository>(
      () => ShareRepositoryImpl(dataSourceImpl: getIt()));

  // Data Sources
  getIt.registerLazySingleton<SharesDataSourceImpl>(
      () => SharesDataSourceImpl(client: http.Client()));

  // Http Services
  getIt.registerLazySingleton(() => http.Client());
}
