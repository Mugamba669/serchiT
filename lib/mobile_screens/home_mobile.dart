// ignore_for_file: library_private_types_in_public_api

import 'package:finda/components/Loader.dart';
import 'package:finda/mobile_screens/search_property_mobile.dart';
import 'package:finda/mobile_screens/submit_property_mobile.dart';
import 'package:finda/pages/SearchPage.dart';

import '../components/rounded_button.dart';
import '../models/LocalFiles.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../components/Space.dart';
import 'package:flutter/material.dart';

class Homemobile extends StatefulWidget {
  const Homemobile({Key? key}) : super(key: key);

  @override
  _HomemobileState createState() => _HomemobileState();
}

class _HomemobileState extends State<Homemobile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder(
      future: Future.delayed(const Duration(seconds: 3)),
      builder: (context, snapshot) {
        return snapshot.connectionState == ConnectionState.waiting
            ? Loader(
                message: "Loading content please wait...",
              )
            : Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        Space(),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: SizedBox(
                            width: size.width * 0.07,
                            child: SvgPicture.asset(LocalSvgs.avatar3,
                                width: size.width / 1.4),
                          ),
                        ),
                        Space(),
                        Text("Let's get you started",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headline5),
                        Space(),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: RoundButton(
                            height: 58,
                            buttonText: "Upload Item",
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const SubmitItem(),
                                ),
                              );
                              setState(() {});
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: RoundButton(
                            height: 58,
                            buttonText: "Search Item",
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const SearchPage(),
                                ),
                              );
                              setState(() {});
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
      },
    );
  }
}
