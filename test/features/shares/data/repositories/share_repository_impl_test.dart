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

  final testShareList = [
    Shares(
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
        status: "ok")
  ];
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
