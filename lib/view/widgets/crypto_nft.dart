import 'package:flutter/material.dart';

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
        const Text(
          'Cryptocurrencey',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
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
