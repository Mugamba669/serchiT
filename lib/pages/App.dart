// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../Splash.dart';
import '../mobile_screens/mobile.dart';
import 'OfflineScreen.dart';

class App extends StatefulWidget {
  bool offline;
  App({Key? key, this.offline = false}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Searchit',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: widget.offline == true ? '/offline' : '/',
    );
  }
}
