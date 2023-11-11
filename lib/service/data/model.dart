import 'dart:convert';

CryptoCurrency cryptoCurrencyFromJson(String str) =>
    CryptoCurrency.fromJson(json.decode(str));

class CryptoCurrency {
  List<Datum>? data;

  CryptoCurrency({
    required this.data,
  });
  factory CryptoCurrency.fromJson(Map<String, dynamic> json) => CryptoCurrency(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  // Method to sort data based on cmc_rank
  void sortByCmcRank() {
    data?.sort((a, b) => a.cmcrank.compareTo(b.cmcrank));
  }
}

class Datum {
  int id;
  String name;
  String symbol;
  String slug;
  int cmcrank;
  Quote quote;

  Datum({
    required this.id,
    required this.name,
    required this.symbol,
    required this.slug,
    required this.cmcrank,
    required this.quote,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        symbol: json["symbol"],
        slug: json["slug"],
        cmcrank: json["cmc_rank"],
        quote: Quote.fromJson(json["quote"]),
      );
}

class Quote {
  Usd usd;

  Quote({
    required this.usd,
  });

  factory Quote.fromJson(Map<String, dynamic> json) => Quote(
        usd: Usd.fromJson(json["USD"]),
      );
}

class Usd {
  double price;
  double volume24H;
  double volumeChange24H;
  double percentChange24H;
  double marketcap;

  Usd(
      {required this.price,
      required this.volume24H,
      required this.volumeChange24H,
      required this.percentChange24H,
      required this.marketcap});

  factory Usd.fromJson(Map<String, dynamic> json) => Usd(
        price: json["price"],
        volume24H: json["volume_24h"],
        volumeChange24H: json["volume_change_24h"],
        percentChange24H: json["percent_change_24h"],
        marketcap: json["market_cap"],
      );
}

// To parse this JSON data, do
//
//     final image = imageFromJson(jsonString);

Image imageFromJson(String str) => Image.fromJson(json.decode(str));

String imageToJson(Image data) => json.encode(data.toJson());

class Image {
  Data data;

  Image({
    required this.data,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  The1 the1;

  Data({
    required this.the1,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        the1: The1.fromJson(json["The1"]),
      );

  Map<String, dynamic> toJson() => {
        "The1": the1.toJson(),
      };
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

  Map<String, dynamic> toJson() => {
        "id": id,
        "logo": logo,
      };
}
