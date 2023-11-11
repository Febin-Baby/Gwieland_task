// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gwieiland_task/data/core/contants.dart';
import 'package:gwieiland_task/view/screens/main_screen.dart';

class WidgetAppbar extends StatelessWidget implements PreferredSize {
  @override
  Size get preferredSize => Size.fromHeight(height);

  final double height;
  const WidgetAppbar({
    Key? key,
    this.height = kToolbarHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List appBarName = [
      'E- SHOP',
      'EXCHANGES',
      'HOME',
      'LAUNCHPADS',
      'WALLET',
    ];
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: ValueListenableBuilder(
          valueListenable: valueNotifier,
          builder: (context, value, child) => textBold(appBarName[value])),
      iconTheme: const IconThemeData(color: Colors.black),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const FaIcon(FontAwesomeIcons.bell),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.settings,
          ),
        ),
      ],
    );
  }

  @override
  Widget get child => throw UnimplementedError();
}
