import 'package:finda/components/Page.dart';
import 'package:finda/components/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../components/Restart.dart';
import '../components/Space.dart';
import '../models/LocalFiles.dart';

class OfflineScreen extends StatelessWidget {
  const OfflineScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CustomPage(
        child: Column(
      children: [
        Space(
          space: 0.2,
        ),
        Center(
          child: SvgPicture.asset(LocalSvgs.offline,
              width: size.width * 0.05, height: size.height / 3),
        ),
        Space(),
        const Text("You are offline",
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500)),
        const Text("Please turn on your internet",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w300)),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: RoundButton(
            buttonText: "Reload",
            onTap: () => RestartWidget.restartApp(context),
          ),
        )
      ],
    ));
  }
}
