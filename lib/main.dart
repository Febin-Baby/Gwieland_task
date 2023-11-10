import 'package:flutter/material.dart';
import 'package:gwieiland_task/view/screens/main_screen.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MainScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }

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
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
