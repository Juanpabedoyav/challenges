import 'package:challenge1/features/shares/data/datasources/shares_data_source_impl.dart';
import 'package:challenge1/features/shares/domain/models/shares.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  late SharesDataSourceImpl dataSource;
  late MockClient mockHttpClient;

  const String turl =
      'https://api.twelvedata.com/time_series?symbol=COP/ARS,COP/VEF&interval=1month&apikey=86a190ff9310404fbbb5e2c9e0e74d8a';

  const sampleDataResponse = '''
  {
    "meta": {
      "symbol": "COP/ARS",
      "interval": "1month",
      "currency_base": "Colombian Peso",
      "currency_quote": "Argentinian Peso",
      "type": "Physical Currency"
    },
    "values": [
      {
        "datetime": "2024-05-01",
        "open": "0.22406",
        "high": "0.23318",
        "low": "0.22270",
        "close": "0.23027"
      }
    ],
    "status": "ok"
  }
  ''';

  setUp(() {
    mockHttpClient = MockClient();
    dataSource = SharesDataSourceImpl(client: mockHttpClient);
  });

  test('should return Shares when the response code is 200 (success)',
      () async {
    // arrange
    when(mockHttpClient.get(Uri.parse(turl)))
        .thenAnswer((_) async => http.Response(sampleDataResponse, 200));

    // act
    final result = await dataSource.getShares();

    // assert
    expect(result, isA<Shares>());
    expect(result.meta.symbol, 'COP/ARS');
    expect(result.values, hasLength(1));
    expect(result.values[0].datetime, DateTime.parse('2024-05-01'));
  });
}
