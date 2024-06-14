// ignore_for_file: constant_identifier_names

import 'package:challenge1/features/shares/domain/entity/share.dart';

class ShareModel extends Share {
  ShareModel({super.code, super.name, required super.pairs});

  // Convert JSON into ShareModel
  // ---------------------------------------------------------------------------
  // JSON
  // ---------------------------------------------------------------------------
  // Maps
  factory ShareModel.fromJson(json) => ShareModel(
        code: json['code'],
        name: json['name'],
        pairs: Map.from(json["pairs"])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
      );
  //toEntity
  toEntity() => Share(
        code: code,
        name: name,
        pairs: pairs,
      );
}
