import 'package:finda/components/Page.dart';
import 'package:finda/mobile_screens/recent_post_mobile.dart';
import 'package:finda/mobile_screens/search_property_mobile.dart';

import 'package:flutter/material.dart';
import 'package:finda/mobile_screens/submit_property_mobile.dart';

import 'home_mobile.dart';

class MobileScreen extends StatefulWidget {
  const MobileScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MobileScreenState createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  final GlobalKey<ScaffoldState> _openDrawer = GlobalKey<ScaffoldState>();
  List drawerItems = [
    {"label": "HOME", "icon": Icons.home_rounded},
    {"label": "SUBMIT FOUND ITEM", "icon": Icons.upload_rounded},
    {"label": "REVIEW RECENT POSTS", "icon": Icons.reviews_rounded},
  ];
  Drawer _showDrawer(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        const UserAccountsDrawerHeader(
          currentAccountPicture: CircleAvatar(
            backgroundImage: AssetImage("assets/splash.png"),
          ),
          accountName: Text("Username"),
          accountEmail: Text("searchi@info.com"),
        ),
        Column(
          children: List.generate(
            drawerItems.length,
            (index) => ListTile(
                leading: Icon(drawerItems[index]["icon"]),
                title: Text(drawerItems[index]["label"]),
                onTap: () {
                  Navigator.of(context).pop();

                  setState(() {
                    currentTabIndex = index;
                  });
                }),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'Copyright © 2022 | SearchIt',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        )
      ],
    ));
  }

  List<Widget> tabs = [
    const Homemobile(),
    const SubmitItem(),
    const RecentpostMob(),
  ];
  List<String> titles = ["Serch it", "Submit found item", "Recent posts"];
  int currentTabIndex = 0;

  void openCloseDrawer() {
    if (_openDrawer.currentState!.isDrawerOpen) {
      _openDrawer.currentState!.openEndDrawer();
    } else {
      _openDrawer.currentState!.openDrawer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomPage(
      endDrawer: _showDrawer(context),
      key: _openDrawer,
      appBar: AppBar(
        // toolbarHeight: 100,
        title: Text(titles[currentTabIndex]),
      ),
      child: tabs[currentTabIndex],
    );
  }
}
