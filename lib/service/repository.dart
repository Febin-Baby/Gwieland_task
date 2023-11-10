import 'package:gwieiland_task/data/api_endpoints/api_datas.dart';
import 'package:gwieiland_task/service/data/model.dart';
import 'package:http/http.dart' as http;

Future<List<Datum>> fetchData() async {
  try {
    Uri uri = Uri.parse(domain);
    http.Response response = await http.get(
      uri,
      headers: {
        'X-CMC_PRO_API_KEY': apikey,
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      CryptoCurrency cryptoCurrency = cryptoCurrencyFromJson(response.body);
      return cryptoCurrency.data ?? [];
    } else {
      // Handle error
      print("Error: ${response.statusCode} - ${response.body}");
      return [];
    }
  } catch (error) {
    // Handle network error
    print("Network error: $error");
    return [];
  }
}
