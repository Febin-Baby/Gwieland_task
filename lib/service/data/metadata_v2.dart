import 'dart:convert';

MetadataV2 metadataV2FromJson(String str) =>
    MetadataV2.fromJson(json.decode(str));

class MetadataV2 {
  Data? data;

  MetadataV2({
    required this.data,
  });

  factory MetadataV2.fromJson(Map<String, dynamic> json) => MetadataV2(
        data: Data.fromJson(json["data"]),
      );
}

class Data {
  The1 the1;

  Data({
    required this.the1,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        the1: The1.fromJson(json["1"]),
      );
}

class The1 {
  int id;
  String logo;

  The1({
    required this.id,
    required this.logo,
  });

  factory The1.fromJson(Map<String, dynamic> json) => The1(
        id: json["id"],
        logo: json["logo"],
      );
}
