// ignore_for_file: must_be_immutable

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  String message;
  Loader({Key? key, this.message = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.blue),
          ),
          AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(message,
                  textStyle: const TextStyle(color: Colors.black, fontSize: 20),
                  speed: const Duration(milliseconds: 80)),
            ],
            repeatForever: true,
          )
        ],
      ),
    );
  }
}
