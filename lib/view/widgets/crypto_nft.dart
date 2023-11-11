import 'package:flutter/material.dart';
import 'package:gwieiland_task/data/core/contants.dart';

class CryptoNFT extends StatelessWidget {
  const CryptoNFT({
    super.key,
    required this.size,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        textBold('Cryptocurrency'),
        SizedBox(
          width: size * .1,
        ),
        const Text(
          'NFT',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
        )
      ],
    );
  }
}
