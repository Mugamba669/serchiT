import '../components/bottom_bar.dart';
import '../components/mobile_bottom_bar.dart';
import '../constant.dart';
import 'package:flutter/material.dart';
import 'package:finda/models/searchposts.dart';

class FullSearchResult extends StatefulWidget {
  final Searchpost searchpost;
  FullSearchResult({Key? key, required this.searchpost}) : super(key: key);
  @override
  _FullSearchResultState createState() => _FullSearchResultState();
}

class _FullSearchResultState extends State<FullSearchResult> {
  @override
  Widget build(BuildContext context) {
    // ui.platformViewRegistry.registerViewFactory(
    //     'image-html',
    //     (int viewId) => ImageElement()
    //       ..src = "https://findabackend.herokuapp.com/public/docImages/" +
    //           "${widget.searchpost.pic}"
    //       ..style.border = 'none');

    return Scaffold(
      appBar: AppBar(
        title: Text("Finda..."),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.7,
              child: Card(
                child: HtmlElementView(viewType: 'image-html'),
                elevation: 8,
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(
                    "First Name attached:",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Flexible(
                  child: Text(
                    "${widget.searchpost.docfirstname}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(
                    "Last Name attached:",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Flexible(
                  child: Text(
                    "${widget.searchpost.doclastname}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(
                    "Date of Birth attached:",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Flexible(
                  child: Text(
                    "${widget.searchpost.dateofbirth}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(
                    "Gender attached:",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Flexible(
                  child: Text(
                    "${widget.searchpost.gender}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(
                    "Nationality attached:",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Flexible(
                  child: Text(
                    "${widget.searchpost.nationality}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(
                    "Location in which item was found:",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Flexible(
                  child: Text(
                    "${widget.searchpost.location}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(
                    "Contact of the person who posted your Document",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(
                    "First Name of the person who posted:",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Flexible(
                  child: Text(
                    "${widget.searchpost.firstname}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(
                    "Last Name of the person who posted:",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Flexible(
                  child: Text(
                    "${widget.searchpost.lastname}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(
                    "Email of the person who posted:",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Flexible(
                  child: Text(
                    "${widget.searchpost.email}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(
                    "Telephone number of the person who posted:",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Flexible(
                  child: Text(
                    "${widget.searchpost.phone}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            MaterialButton(
              color: Colors.grey,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              onPressed: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //       builder: (BuildContext context) => DesktopScreen(),
                //       fullscreenDialog: true),
                // );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 40.0),
                child: Text(
                  "Return to Home Screen",
                  style: TextStyle(
                    color: barColor,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Bottombarmobile()
          ],
        ),
      ),
    );
  }
}
