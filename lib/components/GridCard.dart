// ignore_for_file: file_names, must_be_immutable

import 'package:finda/components/TapEffect.dart';
import 'package:flutter/material.dart';

import 'Space.dart';

class GridCard extends StatelessWidget {
  String? image;
  String? property;
  String? location;
  VoidCallback? tap;

  GridCard({Key? key, this.image, this.property, this.location, this.tap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TapEffect(
      onClick: tap ?? () {},
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridTile(
            footer: Column(
              children: [
                Space(
                  space: 0.5,
                ),
                Text(
                  property!,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 17,
                  ),
                ),
                Text(
                  location!,
                  style: const TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Image.asset(
                "assets/splash.png",
                // "https://findabackend.herokuapp.com/public/docImages/${image!}",
                // "https://v2l.cdnafric.com/genfiles/cms/1/desktop/bonus/rules/1st/1st-africa-slider.jpg",
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
