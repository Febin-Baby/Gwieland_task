import 'package:flutter/material.dart';

class CustumSmallContainer extends StatelessWidget {
  const CustumSmallContainer({
    super.key,
    required this.size,
    required this.khieght,
  });

  final double size;
  final double khieght;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          const CircleAvatar(
            radius: 30,
          ),
          SizedBox(
            width: size * .03,
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('ETH'),
              Text('Etherium'),
            ],
          ),
          SizedBox(
            width: size * .1,
          ),
          Column(
            children: [
              const Icon(
                Icons.line_axis_outlined,
                color: Colors.red,
              ),
              SizedBox(
                height: khieght * .02,
              )
            ],
          ),
          const Spacer(),
          const Column(
            children: [
              Text('89'),
              Text('-21'),
            ],
          )
        ],
      ),
    );
  }
}
