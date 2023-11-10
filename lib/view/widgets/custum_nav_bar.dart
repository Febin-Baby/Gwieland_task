import 'package:flutter/material.dart';
import 'package:gwieiland_task/view/screens/dummy_screens.dart/dummy.dart';

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
          context: context,
          icon: Icons.sentiment_satisfied_alt_sharp,
          text: 'E-shop',
          navigate: const PageEshop(),
        ),
        iconText(
          context: context,
          icon: Icons.compare_arrows_rounded,
          text: 'Exchange',
          colr: Colors.white,
          navigate: const Exchange(),
        ),
        CircleAvatar(
          radius: 35,
          child: Image.asset(
            'assets/images/new sun.png',
            //fit: BoxFit.cover,
          ),
        ),
        iconText(
          context: context,
          icon: Icons.rocket_launch_outlined,
          text: 'Launchpads',
          navigate: const LauchPads(),
        ),
        iconText(
          context: context,
          icon: Icons.wallet_travel_sharp,
          text: 'Wallet',
          navigate: const Wallet(),
        )
      ],
    ),
  );
}

InkWell iconText({
  required BuildContext context,
  required IconData icon,
  required String text,
  required Widget navigate,
  Color? colr = Colors.grey,
}) {
  return InkWell(
    onTap: () => Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => navigate,
      ),
    ),
    child: Column(
      children: [
        IconButton(
          enableFeedback: false,
          onPressed: () {},
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
    ),
  );
}
