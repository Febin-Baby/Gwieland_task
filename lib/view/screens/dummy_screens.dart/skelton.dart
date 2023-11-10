// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class LoadingSkelton extends StatelessWidget {
  const LoadingSkelton({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SkelTon(height: 50, width: 50),
        Column(
          children: [
            SizedBox(height: 5),
            SkelTon(
              height: 20,
              width: 120,
            ),
            SizedBox(height: 7),
            SkelTon(
              height: 20,
              width: 120,
            )
          ],
        ),
        Spacer(),
        Column(
          children: [
            SizedBox(height: 5),
            SkelTon(
              height: 20,
              width: 120,
            ),
            SizedBox(height: 7),
            SkelTon(
              height: 20,
              width: 120,
            )
          ],
        )
      ],
    );
  }
}

class SkelTon extends StatelessWidget {
  const SkelTon({
    Key? key,
    this.height,
    this.width,
  }) : super(key: key);
  final double? height, width;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.07),
        borderRadius: const BorderRadius.all(
          Radius.circular(25),
        ),
      ),
    );
  }
}
