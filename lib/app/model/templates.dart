import 'dart:convert';

import 'package:chatie/app/data/constants/constants.dart';

class Templates {
  String id;
  String image;
  Templates({
    required this.id,
    required this.image,
  });
  factory Templates.fromMap(Map<String, dynamic> map) {
    return Templates(
      id: map['id'] as String,
      image: map['image'] as String,
    );
  }
  factory Templates.fromJson(String source) =>
      Templates.fromMap(json.decode(source) as Map<String, dynamic>);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'image': image,
    };
  }

  String toJson() => json.encode(toMap());
}

List<Templates> templates = [
  Templates(id: '1', image: AppAssets.kTemplate1),
  Templates(id: '2', image: AppAssets.kTemplate2),
  Templates(id: '3', image: AppAssets.kTemplate3),
  Templates(id: '4', image: AppAssets.kTemplate4),
];
