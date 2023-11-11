import 'package:gwieiland_task/data/api_endpoints/api_datas.dart';
import 'package:gwieiland_task/service/data/metadata_v2.dart';
import 'package:http/http.dart' as http;

Future<Object> fetchDataa(int id) async {
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
      // If the server returns a 200 OK response, parse the JSON
      MetadataV2 cryptoCurrency = metadataV2FromJson(response.body);

      return cryptoCurrency.data?.the1 ?? [];
    } else {
      print("Error: ${response.statusCode} - ${response.body}");
      return [];
    }
  } catch (error) {
    // Handle network error
    print("Network error: $error");
    return [];
  }
}
