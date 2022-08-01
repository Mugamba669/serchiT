// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';

import 'package:finda/components/GridCard.dart';
import 'package:finda/components/Loader.dart';
import 'package:finda/models/recentposts.dart';
import 'package:finda/pages/Details.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RecentpostMob extends StatefulWidget {
  const RecentpostMob({Key? key}) : super(key: key);

  @override
  _RecentpostMobState createState() => _RecentpostMobState();
}

class _RecentpostMobState extends State<RecentpostMob> {
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

  ScrollController controller = ScrollController();
  @override
  void initState() {
    controller.addListener(() {
      controller.animateTo(20,
          duration: const Duration(seconds: 2), curve: Curves.bounceInOut);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: FutureBuilder<List<Recentpost>>(
        future: fetchPosts(),
        builder: (context, snapshot) {
          var posts = snapshot.data;
          if (kDebugMode) {
            print(jsonEncode(posts));
          }
          return (snapshot.hasData)
              ? GridView.builder(
                  controller: controller,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 3,
                      crossAxisSpacing: 3),
                  itemCount: posts?.length,
                  itemBuilder: (context, index) {
                    return GridCard(
                      image: posts?[0].pic,
                      property: posts?[index].selecteditem,
                      location: posts?[index].location,
                      tap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Details(
                            post: posts![index],
                          ),
                        ),
                      ),
                    );
                  },
                )
              : snapshot.hasError
                  ? const Center(
                      child: Text("Error while fetching your records"),
                    )
                  : Loader(message: 'Loading all posts...');
        },
      ),
    );
  }
}
