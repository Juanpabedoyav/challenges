import 'package:challenge1/features/shares/domain/models/shares.dart';
import 'package:challenge1/features/shares/domain/repositories/share_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:challenge1/features/shares/domain/usecases/get_shares.dart';
import 'package:mocktail/mocktail.dart';

class MockSharesRepository extends Mock implements SharesRepository {}

void main() {
  late GetShares getShares;
  late MockSharesRepository mockSharesRepository;

  setUp(() {
    mockSharesRepository = MockSharesRepository();
    getShares = GetShares(repository: mockSharesRepository);
  });

  group('GetShares', () {
    test('should return shares', () async {
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
      // arrange
      when(() => mockSharesRepository.getShares())
          .thenAnswer((_) async => testShareList);
      //act
      final result = await getShares();

      // assert
      expect(result, testShareList);
      verify((() => mockSharesRepository.getShares())).called(1);
      verifyNoMoreInteractions(mockSharesRepository);
    });
  });
}
