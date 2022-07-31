import 'package:flutter/material.dart';
import 'package:finda/components/bottom_bar_column.dart';
import 'package:finda/components/info_text.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      color: Colors.blueGrey[900],
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BottomBarColumn(
                heading: "ABOUT",
                s1: 'Contact Us',
                s2: "About Us",
                s3: "Careers",
              ),
              Spacer(),
              BottomBarColumn(
                heading: "HELP",
                s1: 'Payment',
                s2: "Cancellation",
                s3: "FAQ",
              ),
              Spacer(),
              BottomBarColumn(
                heading: "SOCIAL",
                s1: 'Twitter',
                s2: "Facebook",
                s3: "Youtube",
              ),
              Spacer(),
              Container(
                color: Colors.blueGrey,
                width: 2,
                height: 150,
              ),
               Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   InfoText(
                    type: 'Email',
                    text: 'finda@gmail.com',
                  ),
                  SizedBox(height: 5),
                  InfoText(
                    type: 'Address',
                    text: '128, Trymore Road, Delft, MN - 56124',
                  )
                ],
              )
            ],
          ),
          Divider(
            color: Colors.blueGrey,
          ),
          SizedBox(height: 20),
          Text(
            'Copyright © 2021 | Finda',
            style: TextStyle(color: Colors.blueGrey[300], fontSize: 15),
          )
        ],
      ),
    );
  }
}
