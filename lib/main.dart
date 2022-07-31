import 'dart:async';

import 'package:finda/components/Restart.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import './pages/Intro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Splash.dart';
import 'mobile_screens/mobile.dart';
import 'pages/OfflineScreen.dart';
// import 'web_secreens/desktop..dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge,
      overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);

  runApp(
    RestartWidget(
      child: const MyApp(),
    ),
  );
// Check internet connection with singleton (no custom values allowed)
  // await execute(InternetConnectionChecker());

  // Create customized instance which can be registered via dependency injection
  // final InternetConnectionChecker customInstance =
  //     InternetConnectionChecker.createInstance(
  //   checkTimeout: const Duration(seconds: 1),
  //   checkInterval: const Duration(seconds: 1),
  // );

  // Check internet connection with created instance
  // await execute(customInstance);
}

bool internet = false;
Future<bool> execute() async {
  // Simple check to see if we have Internet

  return await InternetConnectionChecker().hasConnection;
  // ignore: avoid_print
  // print(internet.toString());
  // returns a bool

  // We can also get an enum instead of a bool
  // ignore: avoid_print
  // print(
  //   'Current status: ${await InternetConnectionChecker().connectionStatus}',
  // );
  // Prints either InternetConnectionStatus.connected
  // or InternetConnectionStatus.disconnected

  // // actively listen for status updates
  // final StreamSubscription<InternetConnectionStatus> listener =
  //     InternetConnectionChecker().onStatusChange.listen(
  //   (InternetConnectionStatus status) {
  //     switch (status) {
  //       case InternetConnectionStatus.connected:
  //         // ignore: avoid_print
  //         print('Data connection is available.');
  //         break;
  //       case InternetConnectionStatus.disconnected:
  //         // ignore: avoid_print
  //         print('You are disconnected from the internet.');
  //         break;
  //     }
  //   },
  // );

  // close listener after 30 seconds, so the program doesn't run forever
  // await Future<void>.delayed(const Duration(seconds: 30));
  // await listener.cancel();
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
