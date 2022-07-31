// ignore_for_file: file_names, duplicate_ignore, must_be_immutable

import 'package:flutter/material.dart';

class CustomPage extends StatelessWidget {
  Widget child;
  Color bgColor;
  FloatingActionButtonLocation floatingActionButtonLocation;
  Widget floatActionButton;
  Widget endDrawer;
  PreferredSizeWidget? appBar;
  Widget? drawer;

  CustomPage({
    Key? key,
    required this.child,
    this.drawer,
    this.endDrawer = const SizedBox(),
    this.appBar,
    this.bgColor = Colors.white,
    this.floatingActionButtonLocation = FloatingActionButtonLocation.endFloat,
    this.floatActionButton = const Text(""),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: appBar,
      body: SafeArea(
        child: Stack(children: [
          const SizedBox.expand(),
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Container(
              child: child,
            ),
          ),
        ]),
      ),
      floatingActionButton: floatActionButton,
      endDrawer: endDrawer,
      drawer: drawer,
      floatingActionButtonLocation: floatingActionButtonLocation,
    );
  }
}
