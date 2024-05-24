class Shares {
  final SharesMeta meta;
  final List<SharesValue> values;
  final String status;

  Shares({
    required this.meta,
    required this.values,
    required this.status,
  });

  // Convert JSON into Shares
  factory Shares.fromJson(Map<String, dynamic> json) {
    return Shares(
      meta: SharesMeta.fromJson(json['meta']),
      values: (json['values'] as List<dynamic>)
          .map((item) => SharesValue.fromJson(item as Map<String, dynamic>))
          .toList(),
      status: json['status'],
    );
  }

  // Convert Shares to JSON
  Map<String, dynamic> toJson() {
    return {
      'meta': meta.toJson(),
      'values': values.map((item) => item.toJson()).toList(),
      'status': status,
    };
  }
}

class SharesMeta {
  final String symbol;
  final String interval;
  final String currencyBase;
  final String currencyQuote;
  final String type;

  SharesMeta({
    required this.symbol,
    required this.interval,
    required this.currencyBase,
    required this.currencyQuote,
    required this.type,
  });

  // Convert JSON into SharesMeta
  factory SharesMeta.fromJson(Map<String, dynamic> json) {
    return SharesMeta(
      symbol: json['symbol'],
      interval: json['interval'],
      currencyBase: json['currency_base'],
      currencyQuote: json['currency_quote'],
      type: json['type'],
    );
  }

  // Convert SharesMeta to JSON
  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol,
      'interval': interval,
      'currency_base': currencyBase,
      'currency_quote': currencyQuote,
      'type': type,
    };
  }
}

class SharesValue {
  final DateTime datetime;
  final String open;
  final String high;
  final String low;
  final String close;

  SharesValue({
    required this.datetime,
    required this.open,
    required this.high,
    required this.low,
    required this.close,
  });

  // Convert JSON into SharesValue
  factory SharesValue.fromJson(Map<String, dynamic> json) {
    return SharesValue(
      datetime: DateTime.parse(json['datetime']),
      open: json['open'],
      high: json['high'],
      low: json['low'],
      close: json['close'],
    );
  }

  // Convert SharesValue to JSON
  Map<String, dynamic> toJson() {
    return {
      'datetime': datetime.toIso8601String(),
      'open': open,
      'high': high,
      'low': low,
      'close': close,
    };
  }
}
