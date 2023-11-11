import 'dart:convert';
import 'package:gwieiland_task/data/api_endpoints/api_datas.dart';
import 'package:http/http.dart' as http;

Future<String> fetchDataa(int id) async {
  try {
    Uri uri = Uri.parse(
        'https://pro-api.coinmarketcap.com/v2/cryptocurrency/info?id=$id');
    http.Response response = await http.get(
      uri,
      headers: {
        'X-CMC_PRO_API_KEY': apikey,
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      final String img = result['data']['$id']['logo'];
      return img;
    } else {
      print("Error: ${response.statusCode} - ${response.body}");
      return '';
    }
  } catch (error) {
    // Handle network error
    print("Network error: $error");
    return '';
  }
}
