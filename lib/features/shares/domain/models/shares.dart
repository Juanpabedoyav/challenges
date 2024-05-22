class Shares {
  final bool success;
  final String copyright;
  final String terms;
  final String privacy;
  final SharesData data;

  Shares({
    required this.success,
    required this.copyright,
    required this.terms,
    required this.privacy,
    required this.data,
  });

  // convert JSON into Shares
  factory Shares.fromJson(Map<String, dynamic> json) {
    return Shares(
      success: json['success'] as bool,
      copyright: json['copyright'] as String,
      terms: json['terms'] as String,
      privacy: json['privacy'] as String,
      data: SharesData.fromJson(json),
    );
  }
  // convert Shares to JSON
  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'copyright': copyright,
      'terms': terms,
      'privacy': privacy,
      'data': data.toJson(),
    };
  }
}

class SharesData {
  final String code;
  final String name;
  final Map<String, dynamic> pairs;

  SharesData({
    required this.code,
    required this.name,
    required this.pairs,
  });

  // convert JSON into SharesData
  factory SharesData.fromJson(Map<String, dynamic> json) {
    return SharesData(
      code: json['code'] as String,
      name: json['name'] as String,
      pairs: json['pairs'] as Map<String, dynamic>,
    );
  }

  // convert SharesData to JSON
  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'name': name,
      'pairs': pairs,
    };
  }
}
