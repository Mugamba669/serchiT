// ignore_for_file: library_private_types_in_public_api

import 'package:finda/components/Loader.dart';
import 'package:finda/components/Restart.dart';
import 'package:finda/mobile_screens/submit_property_mobile.dart';
import 'package:finda/models/recentposts.dart';
import 'package:finda/pages/Details.dart';
import 'package:search_page/search_page.dart';
import 'package:http/http.dart' as http;

import '../components/rounded_button.dart';
import '../models/LocalFiles.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../components/Space.dart';
import 'package:flutter/material.dart';

class Homemobile extends StatefulWidget {
  const Homemobile({Key? key}) : super(key: key);

  @override
  _HomemobileState createState() => _HomemobileState();
}

class _HomemobileState extends State<Homemobile> {
  showSearchPage(List<Recentpost> posts) {
    showSearch(
      context: context,
      delegate: SearchPage<Recentpost>(
        items: posts,
        searchLabel: 'Search property',
        suggestion: const Center(
          child:
              Text('Search property by item type, name ,nationality, location'),
        ),
        failure: const Center(
          child: Text('No property found :('),
        ),
        filter: (post) => [
          post.selecteditem,
          post.docfirstname,
          post.nationality,
          post.location,
        ],
        builder: (post) => ListTile(
          onTap: () => Navigator.of(context).push(
            PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) {
              return FadeTransition(
                opacity: animation,
                child: Details(post: post),
              );
            }),
          ),
          title: Text(
            "${post.selecteditem}",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
          ),
          subtitle: Text("${post.location}"),
          trailing: Text(
            'by ${post.firstname}',
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w200,
                fontStyle: FontStyle.italic),
          ),
        ),
      ),
    );
  }

  Future<List<Recentpost>> fetchPosts() async {
    var response = await http.get(
        Uri.parse("https://findabackend.herokuapp.com/public/api/fetch/posts"));
    if (response.statusCode == 200) {
      return recentpostFromJson(response.body);
      // print(posts);
    } else {
      throw Exception('Failed to load post');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder<List<Recentpost>>(
      future: fetchPosts(),
      builder: (context, snapshot) {
        var posts = snapshot.data;
        return snapshot.connectionState == ConnectionState.waiting
            ? Loader(
                message: "Loading content please wait...",
              )
            : snapshot.hasData
                ? Column(
                    children: [
                      Expanded(
                        child: ListView(
                          children: [
                            Space(),
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: SizedBox(
                                width: size.width * 0.07,
                                child: SvgPicture.asset(LocalSvgs.avatar3,
                                    width: size.width / 1.4),
                              ),
                            ),
                            Space(),
                            Text("Let's get you started",
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.headline5),
                            Space(),
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: RoundButton(
                                height: 58,
                                buttonText: "Upload Item",
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => const SubmitItem(),
                                    ),
                                  );
                                  setState(() {});
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: RoundButton(
                                height: 58,
                                buttonText: "Search Item",
                                onTap: () {
                                  showSearchPage(posts!);
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                : Center(
                    child: Column(
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Image.asset(Localfiles.empty),
                          ),
                        ),
                        Space(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                              child: Text(
                            "Error while fetching your records",
                            style: Theme.of(context).textTheme.headline5,
                          )),
                        ),
                        Space(),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: RoundButton(
                            buttonText: "Reload App",
                            onTap: () => RestartWidget.restartApp(context),
                          ),
                        ),
                      ],
                    ),
                  );
      },
    );
  }
}
