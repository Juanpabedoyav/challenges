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
