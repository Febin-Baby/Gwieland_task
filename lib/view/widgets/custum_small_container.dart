import 'package:flutter/material.dart';
import 'package:gwieiland_task/data/core/contants.dart';
import 'package:gwieiland_task/service/data/model.dart';
import 'package:gwieiland_task/service/data/repository/metadata_v2.dart';

// ignore: must_be_immutable
class CustumSmallContainer extends StatelessWidget {
  CustumSmallContainer({
    super.key,
    required this.data,
    required this.size,
    required this.khieght,
  });
  Datum data;
  final double size;
  final double khieght;

  @override
  Widget build(BuildContext context) {
    List<String> name = data.name.split(' ');
    return SizedBox(
      child: Row(
        children: [
          //Text(data.cmcrank.toString()),
          FutureBuilder(
            future: fetchDataa(data.id),
            builder: (context, snapshot) {
              print("${snapshot.data}");
              if (!snapshot.hasData) {
                return const CircleAvatar(
                  radius: 22,
                  child: CircularProgressIndicator(),
                );
              }
              return CircleAvatar(
                foregroundImage: NetworkImage(snapshot.data!),
                radius: 22,
              );
            },
          ),
          SizedBox(
            width: size * .03,
          ),
          SizedBox(
            width: size * 0.17,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textBold(data.symbol),
                Text(name[0].toString()),
              ],
            ),
          ),
          Column(
            children: [
              Container(
                height: khieght * .03,
                width: size * .2,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: data.quote.usd.percentChange24H > 0
                        ? const AssetImage('assets/images/green.png')
                        : const AssetImage('assets/images/red.png'),
                  ),
                ),
              ),
              SizedBox(
                height: khieght * .03,
              )
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              textBold('\$${data.quote.usd.price.toInt()} USD'),
              Text(
                data.quote.usd.percentChange24H.toStringAsFixed(1),
                style: data.quote.usd.percentChange24H > 0
                    ? const TextStyle(color: Color.fromARGB(255, 5, 246, 53))
                    : const TextStyle(color: Colors.red),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
