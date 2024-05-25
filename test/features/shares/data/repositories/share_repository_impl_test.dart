import 'package:challenge1/features/shares/data/datasources/network/api_client_impl.dart';
import 'package:challenge1/features/shares/data/repositories/share_repository_impl.dart';
import 'package:challenge1/features/shares/domain/models/shares.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockApi extends Mock implements ApiClientImpl {}

void main() {
  late ShareRepositoryImpl repository;
  late MockApi mockApi;

  setUp(() {
    mockApi = MockApi();
    repository = ShareRepositoryImpl(apiClient: mockApi);
  });

  final testShareList = Shares(
    data: [
      Datum(
        symbol: 'GBP',
        currencyGroup: CurrencyGroup.EXOTIC,
        currencyBase: 'USD',
        currencyQuote: 'GBP',
      ),
      Datum(
        symbol: 'EUR',
        currencyGroup: CurrencyGroup.EXOTIC,
        currencyBase: 'USD',
        currencyQuote: 'EUR',
      ),
      Datum(
        symbol: 'USD',
        currencyGroup: CurrencyGroup.EXOTIC,
        currencyBase: 'USD',
        currencyQuote: 'USD',
      ),
    ],
    count: 3,
    status: 'ok',
  );
  group('description', () {
    test('should return shares from repository', () async {
      // arrange
      when(() => mockApi.getShares()).thenAnswer((_) async => testShareList);
      // act
      final result = await repository.getShares();

      // assert
      expect(result, equals(testShareList));
      verify((() => mockApi.getShares())).called(1);
      expect(result, equals(testShareList));
    });
  });
}
