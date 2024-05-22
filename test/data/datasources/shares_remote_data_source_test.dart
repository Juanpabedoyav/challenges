import 'package:challenge1/features/shares/data/datasources/shares_data_source_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'shares_remote_data_source_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late SharesDataSourceImpl dataSource;
  late MockClient mockHttpClient;

  const String turl = 'https://ziff.p.rapidapi.com/GBP/1.2345/2.5678';

  const String sampleDataResponde = '''{
    "code": "GBP",
    "name": "British Pound",
    "pairs": {
      "GBPADA": 2.5426,
      "GBPANG": 2.291,
      "GBPARK": 1.4737,
      "GBPAUD": 1.907,
      "GBPAWG": 2.287,
      "GBPAZN": 2.16,
      "GBPBAM": 2.288,
      "GBPBBD": 2.541,
      "GBPBGN": 2.288,
      "GBPBMD": 1.271,
      "GBPBND": 1.712,
      "GBPBNT": 1.5955,
      "GBPBSD": 1.271,
      "GBPBZD": 2.562,
      "GBPCAD": 1.735,
      "GBPCUC": 1.271,
      "GBPDAI": 1.2707624015247778,
      "GBPELF": 2.3668,
      "GBPEOS": 1.4584,
      "GBPGRS": 2.2854,
      "GBPKNC": 2.3728,
      "GBPLUNA": 2.0857,
      "GBPMAID": 2.5078,
      "GBPMATIC": 1.7196,
      "GBPNULS": 1.9676,
      "GBPNZD": 2.086,
      "GBPOMG": 1.7762,
      "GBPPAB": 1.271,
      "GBPSGD": 1.712,
      "GBPSTORJ": 2.2147,
      "GBPUSD": 1.2706480304955527,
      "GBPUSDC": 1.2706480304955527,
      "GBPUSDT": 1.2717,
      "GBPXRP": 2.3377,
      "GBPXTZ": 1.2705,
      "GBPZRX": 2.2211
    }
  }''';

  setUp(() {
    mockHttpClient = MockClient();
    dataSource = SharesDataSourceImpl(client: mockHttpClient);
  });

  test('should perform a GET request on a url', () async {
    // arrange
    when(mockHttpClient.get(Uri.parse(turl), headers: {
      'x-rapidapi-key': '3039ed9becmsh30b3d62963b1ff4p1a6367jsnfe145e558f5a',
      'x-rapidapi-host': 'ziff.p.rapidapi.com'
    })).thenAnswer((_) async => http.Response(sampleDataResponde, 200));

    // act
    await dataSource.getShares();

    // assert
    verify(mockHttpClient.get(Uri.parse(turl), headers: {
      'x-rapidapi-key': '3039ed9becmsh30b3d62963b1ff4p1a6367jsnfe145e558f5a',
      'x-rapidapi-host': 'ziff.p.rapidapi.com'
    })).called(1);
  });
}
