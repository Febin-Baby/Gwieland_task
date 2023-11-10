import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:gwieiland_task/view/widgets/cystum_appbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  void fetchData() async {
    const String apiKey = '302cf476-d4ef-4b94-85b1-458a867b4371';
    const String apiUrl =
        'https://pro-api.coinmarketcap.com/v2/cryptocurrency/info';

    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {'X-CMC_PRO_API_KEY': apiKey},
      );

      if (response.statusCode == 200) {
        // Parse and use the response data
        print('Response: ${response.body}');
      } else {
        // Handle errors
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: WidgetAppbar(),
    );
  }
}
