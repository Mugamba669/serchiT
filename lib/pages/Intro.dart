// ignore_for_file: library_private_types_in_public_api

import 'dart:async';
import 'package:finda/components/Page.dart';
import 'package:flutter/material.dart';
// import '../components/rounded_button.dart';
import '../components/rounded_button.dart';
import '../models/LocalFiles.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../models/PageView.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({Key? key}) : super(key: key);

  @override
  _IntroductionScreenState createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen>
    with SingleTickerProviderStateMixin {
  var pageController = PageController(initialPage: 0);
  late AnimationController bottomAnimationController;
  List<PageViewData> pageViewModelData = [];

  late Timer sliderTimer;
  var currentShowIndex = 0;

  @override
  void initState() {
    bottomAnimationController = AnimationController(
      // value: 50,
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    pageViewModelData.add(PageViewData(
        titleText: 'Exclusive care for you',
        subText:
            "Losing or misplacing your property can be frustrating and become such a hassle to find. At Searchit, we answer all that by providing an intelligent lost and found matching system, which automatically identifies, matches, and pairs recently lost or found items with one another.",
        assetsImage: Localfiles.submit_lost));

    pageViewModelData.add(PageViewData(
      titleText: 'Intelligent Lost & Found Online Mechanism',
      subText:
          "Searchit is an entirely new intelligent lost and found matching system.",
      assetsImage: Localfiles.lostFound,
    ));

    pageViewModelData.add(PageViewData(
      titleText: 'Intelligent Lost & Found Online Mechanism',
      subText:
          "We’re working with local and regional institutions to submit found items into our matching system.",
      assetsImage: Localfiles.intel,
    ));

    sliderTimer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (currentShowIndex == 0) {
        pageController.animateTo(MediaQuery.of(context).size.width,
            duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
      } else if (currentShowIndex == 1) {
        pageController.animateTo(MediaQuery.of(context).size.width * 2,
            duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
      } else if (currentShowIndex == 2) {
        pageController.animateTo(0,
            duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
      }
    });
    super.initState();
  }

  double height = 250;

  @override
  void dispose() {
    sliderTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPage(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatActionButton: SizedBox(
        height: MediaQuery.of(context).size.height / 4,
        child: Center(
          child: Column(
            children: [
              SmoothPageIndicator(
                controller: pageController, // PageController
                count: pageViewModelData.length, // total page count
                effect: WormEffect(
                    activeDotColor: Theme.of(context).primaryColor,
                    dotColor: Colors.black38,
                    dotHeight: 10.0,
                    dotWidth: 10.0,
                    spacing: 5.0), // your preferred effect
                onDotClicked: (index) {
                  setState(() {
                    currentShowIndex = index;
                  });
                },
              ),
              RoundButton(
                height: 60,
                backgroundColor: Colors.red,
                padding: const EdgeInsets.only(
                    left: 48, right: 48, bottom: 8, top: 32),
                buttonText: "GET STARTED",
                onTap: () => Navigator.of(context).pushNamed("/home"),
              ),
            ],
          ),
        ),
      ),
      child: PageView(
        controller: pageController,
        pageSnapping: true,
        onPageChanged: (index) {
          setState(() {
            currentShowIndex = index;
          });
        },
        scrollDirection: Axis.horizontal,
        children: List.generate(
          pageViewModelData.length,
          (index) => PagePopup(imageData: pageViewModelData[index]),
        ),
      ),
    );
  }

  // void showLoginUi() {
  //   showCupertinoModalPopup(
  //       context: context,
  //       builder: (context) {
  //         return SizedBox(
  //           height: MediaQuery.of(context).size.height / 1.2,
  //           child: const Padding(
  //             padding: EdgeInsets.only(left: 5.0, right: 5.0),
  //             child: ClipRRect(
  //               child: LoginScreen(),
  //               borderRadius: BorderRadius.only(
  //                 topLeft: Radius.circular(30),
  //                 topRight: Radius.circular(30),
  //               ),
  //             ),
  //           ),
  //         );
  //       });
  // }

  // showSignUi() {
  //   showCupertinoModalPopup(
  //       context: context,
  //       builder: (context) {
  //         return SizedBox(
  //           height: MediaQuery.of(context).size.height / 1.2,
  //           child: const Padding(
  //             padding: EdgeInsets.only(left: 5.0, right: 5.0),
  //             child: ClipRRect(
  //               child: SignUpScreen(),
  //               borderRadius: BorderRadius.only(
  //                 topLeft: Radius.circular(30),
  //                 topRight: Radius.circular(30),
  //               ),
  //             ),
  //           ),
  //         );
  //       });
  // }
}
