import 'dart:convert';

CryptoCurrency cryptoCurrencyFromJson(String str) =>
    CryptoCurrency.fromJson(json.decode(str));

String cryptoCurrencyToJson(CryptoCurrency data) => json.encode(data.toJson());

class CryptoCurrency {
  List<Datum> data;

  CryptoCurrency({
    required this.data,
  });

  factory CryptoCurrency.fromJson(Map<String, dynamic> json) => CryptoCurrency(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  int id;
  String? name;
  String? symbol;
  String? slug;
  Quote? quote;

  Datum({
    required this.id,
    this.name,
    this.symbol,
    this.slug,
    this.quote,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"] ?? 'No name',
        symbol: json["symbol"] ?? 'No symbol',
        slug: json["slug"] ?? 'No',
        quote: Quote.fromJson(json["quote"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "symbol": symbol,
        "slug": slug,
        "quote": quote.toJson(),
      };
}

class Quote {
  Usd usd;

  Quote({
    required this.usd,
  });

  factory Quote.fromJson(Map<String, dynamic> json) => Quote(
        usd: Usd.fromJson(json["USD"]),
      );

  Map<String, dynamic> toJson() => {
        "USD": usd.toJson(),
      };
}

class Usd {
  double price;
  double volume24H;
  double volumeChange24H;
  double percentChange24H;

  Usd({
    required this.price,
    required this.volume24H,
    required this.volumeChange24H,
    required this.percentChange24H,
  });

  factory Usd.fromJson(Map<String, dynamic> json) => Usd(
        price: json["price"],
        volume24H: json["volume_24h"]?.toDouble(),
        volumeChange24H: json["volume_change_24h"]?.toDouble(),
        percentChange24H: json["percent_change_24h"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "price": price,
        "volume_24h": volume24H,
        "volume_change_24h": volumeChange24H,
        "percent_change_24h": percentChange24H,
      };
}
