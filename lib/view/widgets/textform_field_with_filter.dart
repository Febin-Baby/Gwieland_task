import 'package:flutter/material.dart';
import 'package:gwieiland_task/data/core/contants.dart';

class TextFormFieldWithFilter extends StatelessWidget {
  const TextFormFieldWithFilter(
      {super.key, required this.size, required this.khieght});
  final double size;
  final double khieght;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: khieght * .07,
          width: size * .6,
          child: TextFormField(
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  color: Colors.white,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  color: Colors.white,
                ),
              ),
              fillColor: Colors.grey[200],
              filled: true,
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.grey,
              ),
              hintText: 'Search cryptocurrency',
              hintStyle: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        ),
        const Spacer(),
        SizedBox(
          height: khieght * .06,
          width: size * .2,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.filter_list,
                  color: Colors.grey,
                  size: size * .05,
                ),
                SizedBox(
                  width: size * .01,
                ),
                const Text(
                  'Filter',
                  style: kgrey,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
