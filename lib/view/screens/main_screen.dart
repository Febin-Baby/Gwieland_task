import 'package:flutter/material.dart';
import 'package:gwieiland_task/service/data/model.dart';
import 'package:gwieiland_task/service/repository.dart';
import 'package:gwieiland_task/view/screens/dummy_screens.dart/skelton.dart';
import 'package:gwieiland_task/view/widgets/crypto_nft.dart';
import 'package:gwieiland_task/view/widgets/custum_nav_bar.dart';
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
  Datum? selectedDatum;
  List<Datum>? dataList;
  String selectedFilter = 'Price';
  final List<String> filter = ['Price', 'Volume 24H'];
  int? id;
  int? index;

  @override
  void initState() {
    super.initState();
    fetchData(2).then((data) {
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
      body: FutureBuilder(
        future: fetchData(id ?? 1),
        builder: (context, snapshot) {
          index = snapshot.data![index ?? 1].cmcrank;
          id = snapshot.data![index ?? 1].id;
          if (snapshot.connectionState == ConnectionState.waiting) {
            // If the Future is still running, show a loading indicator
            return ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                height: khieght * .01,
              ),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => const LoadingSkelton(),
              itemCount: 20,
            );
          } else if (snapshot.hasError) {
            // If the Future encounters an error, display the error message
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            // If the Future is completed but the data is empty, show a message
            return const Center(child: Text('No data available'));
          } else {
            // By default It will disolay CMC Rank List order.

            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: ListView(
                    children: [
                      Row(
                        children: [
                          const Text('Filter:'),
                          const SizedBox(width: 10),
                          DropdownButton<String>(
                            value: selectedFilter,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedFilter = newValue!;
                              });
                            },
                            items: filter
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
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
                      SizedBox(
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
                      )
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
            );
          }
        },
      ),
    );
  }
}
