import 'package:flutter/material.dart';
import 'package:gwieiland_task/view/screens/main_screen.dart';

Container buildMyNavBar(BuildContext context) {
  return Container(
    height: 75,
    decoration: const BoxDecoration(
      color: Color.fromARGB(255, 27, 27, 27),
      borderRadius: BorderRadius.all(Radius.circular(25)),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        iconText(
          number: 0,
          context: context,
          icon: Icons.sentiment_satisfied_alt_sharp,
          text: '€-\$hop',
        ),
        iconText(
          number: 1,
          context: context,
          icon: Icons.compare_arrows_rounded,
          text: 'Exchange',
          colr: Colors.white,
        ),
        InkWell(
          onTap: () {
            valueNotifier.value = 2;
            valueNotifier.notifyListeners();
          },
          child: CircleAvatar(
            radius: 35,
            child: Image.asset(
              'assets/images/new sun.png',
            ),
          ),
        ),
        iconText(
          number: 3,
          context: context,
          icon: Icons.rocket_launch_outlined,
          text: 'Launchpads',
        ),
        iconText(
          number: 4,
          context: context,
          icon: Icons.wallet_travel_sharp,
          text: 'Wallet',
        )
      ],
    ),
  );
}

Column iconText({
  required int number,
  required BuildContext context,
  required IconData icon,
  required String text,
  Color? colr = Colors.grey,
}) {
  return Column(
    children: [
      IconButton(
        enableFeedback: false,
        onPressed: () {
          debugPrint('touch');
          valueNotifier.value = number;
          valueNotifier.notifyListeners();
        },
        icon: Icon(
          icon,
          color: colr,
          size: 20,
        ),
      ),
      Text(
        text,
        style: TextStyle(color: colr, fontSize: 11),
      )
    ],
  );
}
