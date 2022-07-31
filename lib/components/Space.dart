// ignore_for_file: file_names

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Space extends StatelessWidget {
  double space;
  Space({Key? key, this.space = 0.03}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * space,
    );
  }
}
