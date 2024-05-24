import 'package:challenge1/features/shares/data/datasources/shares_data_source_impl.dart';
import 'package:challenge1/features/shares/data/repositories/share_repository_impl.dart';
import 'package:challenge1/features/shares/domain/models/shares.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSharesDataSourceImpl extends Mock implements SharesDataSourceImpl {}

void main() {
  late ShareRepositoryImpl repository;
  late MockSharesDataSourceImpl mockSharesDataSource;

  setUp(() {
    mockSharesDataSource = MockSharesDataSourceImpl();
    repository = ShareRepositoryImpl(dataSourceImpl: mockSharesDataSource);
  });

  final testShareList = Shares(
      meta: SharesMeta(
          symbol: "GBP",
          interval: "1m",
          currencyBase: "USD",
          currencyQuote: "GBP",
          type: "spot"),
      values: [
        SharesValue(
            datetime: DateTime.parse("2023-01-01"),
            open: "1.2345",
            high: "1.2345",
            low: "1.2345",
            close: "1.2345")
      ],
      status: "ok");

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
