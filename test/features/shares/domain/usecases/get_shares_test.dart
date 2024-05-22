import 'package:challenge1/features/shares/domain/models/shares.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:challenge1/features/shares/domain/repositories/share_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:challenge1/features/shares/domain/usecases/get_shares.dart';
import 'get_shares_test.mocks.dart';

@GenerateNiceMocks([MockSpec<SharesRepository>()])
void main() {
  late GetShares usecase;
  late MockSharesRepository mockSharesRepository;

  setUp(() {
    mockSharesRepository = MockSharesRepository();
    usecase = GetShares(mockSharesRepository);
  });

  final testShareList =
      SharesData(code: "GBP", name: "British Pound", pairs: {"GBPBBD": 2.541});

  test('should return shares', () async {
    // arrange
    when(mockSharesRepository.getShares())
        .thenAnswer((_) async => testShareList);
    //act
    final result = await usecase();

    // assert
    expect(result, testShareList);
    verify(mockSharesRepository.getShares());
    verifyNoMoreInteractions(mockSharesRepository);
  });
}
