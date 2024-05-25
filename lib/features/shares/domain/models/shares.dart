class Shares {
  final List<Datum> data;
  final int count;
  final String status;

  Shares({
    required this.data,
    required this.count,
    required this.status,
  });

  // Convert JSON into Shares
  // ---------------------------------------------------------------------------
  // JSON
  // ---------------------------------------------------------------------------
  // Maps
  factory Shares.fromJson(json) {
    var list = json['data'] as List<dynamic>;
    List<Datum> listShares = list.map((e) => Datum.fromJson(e)).toList();
    return Shares(
      data: listShares,
      count: json['count'],
      status: json['status'],
    );
  }
}

class Datum {
  final String symbol;
  final CurrencyGroup currencyGroup;
  final String currencyBase;
  final String currencyQuote;

  Datum({
    required this.symbol,
    required this.currencyGroup,
    required this.currencyBase,
    required this.currencyQuote,
  });

  // Maps
  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        symbol: json['symbol'],
        currencyGroup: CurrencyGroup.MINOR,
        currencyBase: json['currency_base'],
        currencyQuote: json['currency_quote'],
      );
}

enum CurrencyGroup { EXOTIC, EXOTIC_CROSS, MAJOR, MINOR }
