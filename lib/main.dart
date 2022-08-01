import 'dart:async';
import 'dart:io';

import 'package:finda/components/Restart.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import './pages/Intro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Splash.dart';
import 'mobile_screens/mobile.dart';
import 'pages/OfflineScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge,
      overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  Hive.init("${Directory.current.path}stoarge/emulated/0/");
  if (kDebugMode) {
    print("${Directory.current.path}stoarge/emulated/0/");
  }
  runApp(
    RestartWidget(
      child: const MyApp(),
    ),
  );
}

bool internet = false;
Future<bool> execute() async {
  // Simple check to see if we have Internet
  return await InternetConnectionChecker().hasConnection;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Searchit',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Splash(checkNet: execute()),
        "/intro": (context) => const IntroductionScreen(),
        '/offline': (context) => const OfflineScreen(),
        "/home": (context) => const MobileScreen(),
      },
    );
  }
}
