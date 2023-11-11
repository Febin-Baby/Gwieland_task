import 'package:flutter/material.dart';

const kgrey = TextStyle(color: Colors.grey);
const Color kblack = Colors.black;
Widget textBold(String text) {
  return Text(
    text,
    overflow: TextOverflow.ellipsis,
    style: const TextStyle(
      color: kblack,
      fontSize: 19,
      fontWeight: FontWeight.w700,
    ),
  );
}
