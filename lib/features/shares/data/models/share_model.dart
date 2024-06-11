// ignore_for_file: constant_identifier_names

import 'package:challenge1/features/shares/domain/entity/share.dart';

class ShareModel extends Share {
  ShareModel({super.code, super.name, super.pairs});

  // Convert JSON into ShareModel
  // ---------------------------------------------------------------------------
  // JSON
  // ---------------------------------------------------------------------------
  // Maps
  factory ShareModel.fromJson(json) => ShareModel(
        code: json['code'],
        name: json['name'],
        pairs: json['pairs'].map((pair) => pair.fromJson(pair)).toList(),
      );
}
