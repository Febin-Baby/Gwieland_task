import 'package:flutter/material.dart';
import 'package:gwieiland_task/service/data/model.dart';
import 'package:gwieiland_task/service/repository.dart';
import 'package:gwieiland_task/view/screens/dummy_screens.dart/dummy.dart';
import 'package:gwieiland_task/view/widgets/crypto_nft.dart';
import 'package:gwieiland_task/view/widgets/custum_small_container.dart';
import 'package:gwieiland_task/view/widgets/cystum_appbar.dart';
import 'package:gwieiland_task/view/widgets/detail_container.dart';
import 'package:gwieiland_task/view/widgets/textform_field_with_filter.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int pageIndex = 0;

  final pages = [
    const PageEshop(),
    const Exchange(),
    const MainScreen(),
    const LauchPads(),
    const Wallet()
  ];
  Datum? selectedDatum;
  List<Datum>? dataList;

  @override
  void initState() {
    super.initState();
    fetchData().then((data) {
      setState(() {
        dataList = data;
        if (data.isNotEmpty) {
          selectedDatum = data[0];
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    final khieght = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const WidgetAppbar(),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: ListView(
              children: [
                TextFormFieldWithFilter(size: size, khieght: khieght),
                SizedBox(height: khieght * .02),
                CryptoNFT(size: size),
                SizedBox(height: khieght * .02),
                if (selectedDatum != null) ...[
                  DetailContainer(
                    size: size,
                    khieght: khieght,
                    data: selectedDatum!,
                  ),
                  SizedBox(height: khieght * .02),
                ],
                SizedBox(height: khieght * .02),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Top cryptocurencies',
                      style: TextStyle(fontSize: 19),
                    ),
                    Text('View all'),
                  ],
                ),
                SizedBox(
                  height: khieght * .02,
                ),
                FutureBuilder(
                  future: fetchData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      // If the Future is still running, show a loading indicator
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      // If the Future encounters an error, display the error message
                      return Text('Error: ${snapshot.error}');
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      // If the Future is completed but the data is empty, show a message
                      return const Center(child: Text('No data available'));
                    } else {
                      return SizedBox(
                        child: ListView.separated(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            if (index > 0 && selectedDatum != null) {
                              // Display other items from the list
                              return CustumSmallContainer(
                                size: size,
                                khieght: khieght,
                                data: snapshot.data![index],
                              );
                            } else {
                              return Container();
                            }
                          },
                          separatorBuilder: (context, index) => SizedBox(
                            height: khieght * .02,
                          ),
                          itemCount: 20,
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 13,
            left: 10,
            right: 10,
            child: buildMyNavBar(context),
          )
        ],
      ),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 75,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 27, 27, 27),
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          iconText(icon: Icons.sentiment_satisfied_alt_sharp, text: 'E-shop'),
          iconText(
              icon: Icons.compare_arrows_rounded,
              text: 'Exchange',
              colr: Colors.white),
          CircleAvatar(
            radius: 35,
            child: Image.asset(
              'assets/images/new sun.png',
              //fit: BoxFit.cover,
            ),
          ),
          iconText(icon: Icons.rocket_launch_outlined, text: 'Launchpads'),
          iconText(icon: Icons.wallet_travel_sharp, text: 'Wallet')
        ],
      ),
    );
  }

  Column iconText({
    required IconData icon,
    required String text,
    Color? colr = Colors.grey,
  }) {
    return Column(
      children: [
        IconButton(
          enableFeedback: false,
          onPressed: () {},
          icon: Icon(
            icon,
            color: colr,
            size: 20,
          ),
        ),
        Text(
          text,
          style: TextStyle(color: colr, fontSize: 11),
        )
      ],
    );
  }
}
