import 'package:challenge1/features/shares/data/datasources/shares_data_source_impl.dart';
import 'package:challenge1/features/shares/data/repositories/share_repository_impl.dart';
import 'package:challenge1/features/shares/domain/models/shares.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'share_repository_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<SharesDataSourceImpl>()])
void main() {
  late ShareRepositoryImpl repository;
  late MockSharesDataSourceImpl mockSharesDataSource;

  setUp(() {
    mockSharesDataSource = MockSharesDataSourceImpl();
    repository = ShareRepositoryImpl(dataSourceImpl: mockSharesDataSource);
  });

  final testShareList =
      SharesData(code: "GBP", name: "British Pound", pairs: {"GBPBBD": 2.541});

  test('should return shares from repository', () async {
    // arrange
    when(mockSharesDataSource.getShares())
        .thenAnswer((_) async => testShareList);
    // act
    final result = await repository.getShares();
    // assert

    verify(mockSharesDataSource.getShares());
    expect(result, equals(testShareList));
  });
}
