import 'package:finda/components/Space.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_svg/svg.dart';

import './components/Page.dart';
import 'package:flutter/material.dart';

import 'models/LocalFiles.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class Splash extends StatefulWidget {
  Future<bool> checkNet;
  Splash({Key? key, required this.checkNet}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  initState() {
    super.initState();
    executeNextProcess();
  }

  executeNextProcess() async {
    bool checker = await widget.checkNet;
    if (kDebugMode) {
      print("Net check :$checker");
    }
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(
          context, checker == true ? '/intro' : '/offline');
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomPage(
      bgColor: Colors.white,
      child: Center(
        child: Column(
          children: [
            Space(
              space: 0.12,
            ),
            Image.asset(Localfiles.avatar),
            // SvgPicture.asset(LocalSvgs.avatar3),
            Space(
              space: 0.04,
            ),
            const CircularProgressIndicator.adaptive(),
            Space(
              space: 0.04,
            ),
            RichText(
                text: const TextSpan(children: [
                  TextSpan(
                    text: 'Serch',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: 'it',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                    ),
                  ),
                ]),
                textAlign: TextAlign.center),
            Space(),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "We help you find your property....",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
