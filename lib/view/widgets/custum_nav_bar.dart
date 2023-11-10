import 'package:flutter/material.dart';
import 'package:gwieiland_task/view/screens/dummy_screens.dart/dummy.dart';
import 'package:gwieiland_task/view/screens/main_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;

  final pages = [
    const PageEshop(),
    const Exchange(),
    const MainScreen(),
    const LauchPads(),
    const Wallet()
  ];

  @override
  Widget build(BuildContext context) {
    int pageIndex = 0;

    final pages = [
      const PageEshop(),
      const Exchange(),
      const MainScreen(),
      const LauchPads(),
      const Wallet()
    ];
    return Scaffold(
      bottomNavigationBar: Container(
        height: 60,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              enableFeedback: false,
              onPressed: () {},
              icon: const Icon(
                Icons.home_outlined,
                color: Colors.white,
                size: 35,
              ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {},
              icon: const Icon(
                Icons.work_outline_outlined,
                color: Colors.white,
                size: 35,
              ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {},
              icon: const Icon(
                Icons.widgets_outlined,
                color: Colors.white,
                size: 35,
              ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {},
              icon: const Icon(
                Icons.person_outline,
                color: Colors.white,
                size: 35,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
