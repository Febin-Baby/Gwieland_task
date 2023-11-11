import 'package:flutter/material.dart';
import 'package:gwieiland_task/controller/drop_down_buttun.dart';

class DropDownProductAdd extends StatelessWidget {
  const DropDownProductAdd({super.key, required this.dropDownController});
  final DropdownController dropDownController;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: dropDownController.value,
      isExpanded: true,
      icon: const Icon(Icons.arrow_drop_down),
      iconSize: 13,
      items: dropDownController.item.map(
        (String components) {
          return DropdownMenuItem(
            value: components,
            child: Text(components),
          );
        },
      ).toList(),
      onChanged: (value) {
        debugPrint('on changed ${dropDownController.selectItem(value!)}');
        dropDownController.selectItem(value);
      },
    );
  }
}
