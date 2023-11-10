import 'package:flutter/material.dart';
import 'package:gwieiland_task/service/data/model.dart';

class DetailContainer extends StatelessWidget {
  const DetailContainer({
    super.key,
    required this.data,
    required this.khieght,
    required this.size,
  });

  final Datum data;
  final double khieght;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
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
              padding: EdgeInsets.only(top: size * .01, left: size * .04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.symbol,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(data.name),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(top: size * .01),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "\$${data.quote.usd.price.toInt()} USD",
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    '+${data.quote.usd.percentChange24H.toStringAsFixed(1)}%',
                    style: const TextStyle(
                      color: Color.fromARGB(255, 0, 243, 8),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
