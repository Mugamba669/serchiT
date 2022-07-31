// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';

class CheckNetwork extends StatelessWidget {
  const CheckNetwork({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Offline Demo"),
      ),
      body: OfflineBuilder(
        connectivityBuilder: (context, connectivity, child) {
          final bool connected = connectivity != ConnectivityResult.none;
          return Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                height: 24.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  color: connected
                      ? const Color(0xFF00EE44)
                      : const Color(0xFFEE4400),
                  child: Center(
                    child: Text(connected ? 'ONLINE' : 'OFFLINE'),
                  ),
                ),
              ),
              const Center(
                child: Text(
                  'Yay!',
                ),
              ),
            ],
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'There are no bottons to push :)',
            ),
            const Text(
              'Just turn off your internet.',
            ),
          ],
        ),
      ),
    );
  }
}
