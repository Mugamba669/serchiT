// ignore_for_file: must_be_immutable

import 'package:finda/components/CardTile.dart';
import 'package:finda/components/Page.dart';
import 'package:finda/components/Space.dart';
import 'package:finda/components/TapEffect.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/recentposts.dart';

class Details extends StatefulWidget {
  Recentpost post;
  Details({Key? key, required this.post}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  // send mail
  void _composeMail(String mail) {
// #docregion encode-query-parameters
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: mail,
    );

    launchUrl(emailLaunchUri);
// #enddocregion encode-query-parameters
  }

  void invokeCallDailer(String phone) {
    final Uri launch = Uri(scheme: "tel", path: phone);
    launchUrl(launch);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CustomPage(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.zero,
              width: size.width,
              height: size.height / 3,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter:
                      ColorFilter.mode(Colors.black45, BlendMode.darken),
                  image: NetworkImage(
                    "https://v2l.cdnafric.com/genfiles/cms/1/desktop/bonus/rules/1st/1st-africa-slider.jpg",
                  ),
                ),
              ),
              child: Center(
                child: Stack(children: [
                  Positioned(
                    left: 10,
                    top: 10,
                    child: TapEffect(
                      onClick: () => Navigator.of(context).pop(),
                      child: const CircleAvatar(
                        child: Icon(
                          Icons.arrow_back_ios,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      "Details",
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          ?.copyWith(color: Colors.white),
                    ),
                  ),
                ]),
              ),
            ),
            CardTile(
              icon: Icons.align_horizontal_right_rounded,
              label: "Property Name:",
              name: widget.post.selecteditem,
            ),
            Space(),
            CardTile(
                icon: Icons.location_on,
                label: "Location",
                name: widget.post.location),
            // Space(),
            CardTile(
              icon: Icons.date_range_rounded,
              label: "Date uploaded",
              name: widget.post.createdAt?.toIso8601String(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Divider(
                  color: Colors.black,
                ),
                Text("Uploaded by", style: TextStyle(fontSize: 16)),
                Divider(
                  thickness: 5,
                )
              ],
            ),
            Space(),
            CardTile(
              icon: Icons.person,
              label: "Name",
              name: "${widget.post.docfirstname}   ${widget.post.doclastname}",
            ),

            Space(),
            CardTile(
              icon: Icons.countertops,
              label: "Nationality",
              name: widget.post.nationality,
            ),
            CardTile(
                icon: Icons.phone_android,
                label: "Phone contact",
                name: widget.post.phone,
                trailer: TapEffect(
                  onClick: () => invokeCallDailer(widget.post.phone!),
                  child: const CircleAvatar(
                    child: Icon(Icons.phone),
                  ),
                )),
            CardTile(
                icon: Icons.mark_email_read,
                label: "Email",
                name: widget.post.email,
                trailer: TapEffect(
                  onClick: () => _composeMail(widget.post.email!),
                  child: const CircleAvatar(
                    child: Icon(Icons.mail),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
