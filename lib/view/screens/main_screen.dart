import 'package:flutter/material.dart';
import 'package:gwieiland_task/view/widgets/crypto_nft.dart';
import 'package:gwieiland_task/view/widgets/custum_small_container.dart';
import 'package:gwieiland_task/view/widgets/cystum_appbar.dart';
import 'package:gwieiland_task/view/widgets/textform_field_with_filter.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    final khieght = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const WidgetAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: ListView(
          children: [
            TextFormFieldWithFilter(size: size, khieght: khieght),
            SizedBox(height: khieght * .02),
            CryptoNFT(size: size),
            SizedBox(height: khieght * .02),
            Container(
              height: khieght * .2,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 230, 248, 236),
                image: const DecorationImage(
                  alignment: Alignment.bottomRight,
                  image: AssetImage(
                    'assets/images/graph.png',
                  ),
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  top: size * .07,
                  left: size * .07,
                  right: size * .07,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 22,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: size * .01, left: size * .04),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('BTC'),
                          Text('Bitcoin'),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: EdgeInsets.only(top: size * .01),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('007890'),
                          Text('-66'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
            SizedBox(
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) =>
                    CustumSmallContainer(size: size, khieght: khieght),
                separatorBuilder: (context, index) => SizedBox(
                  height: khieght * .02,
                ),
                itemCount: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
