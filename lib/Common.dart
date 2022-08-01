// ignore: file_names
// ignore_for_file: file_names

import "package:flutter/material.dart";

// ignore: must_be_immutable
class Common extends StatefulWidget {
  Widget child;
  Common({Key? key, required this.child}) : super(key: key);

  @override
  State<Common> createState() => _CommonState();
}

class _CommonState extends State<Common> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [const SizedBox(), widget.child],
      ),
    ));
  }
}
