import 'package:challenge1/features/shares/domain/models/shares.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:challenge1/features/shares/domain/repositories/share_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:challenge1/features/shares/domain/usecases/get_shares.dart';

class MockSharesRepository extends Mock implements SharesRepository {}

@GenerateNiceMocks([MockSpec<SharesRepository>()])
void main() {
  late GetShares usecase;
  late MockSharesRepository mockSharesRepository;

  setUp(() {
    mockSharesRepository = MockSharesRepository();
    usecase = GetShares(mockSharesRepository);
  });

  final testShareList = [
    SharesData(code: 'code', name: 'name', pairs: {'1': 1.0, '2': 2.0}),
    SharesData(code: 'code', name: 'name', pairs: {'1': 1.0, '2': 4.0})
  ];
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
