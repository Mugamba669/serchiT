// ignore_for_file: unnecessary_null_comparison, prefer_typing_uninitialized_variables, use_build_context_synchronously, library_private_types_in_public_api, import_of_legacy_library_into_null_safe

import 'dart:convert';
// import 'dart:html';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:finda/models/LocalFiles.dart';
import 'package:flutter/foundation.dart';
import '../components/rounded_button.dart';
import '../models/searchposts.dart';
import 'package:flutter/material.dart';
import '../components/detail_fields.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:http/http.dart' as http;
import 'package:another_flushbar/flushbar.dart';

import '../constant.dart';

class SearchingPoint extends StatefulWidget {
  const SearchingPoint({Key? key}) : super(key: key);

  @override
  _SearchingPointState createState() => _SearchingPointState();
}

const _youAre = 'You have';
const _subscri = 'subscribed.';

class _SearchingPointState extends State<SearchingPoint> {
  List<Widget> searchingpersonInfo(double width) {
    return <Widget>[
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0),
        child: Image.asset(
          Localfiles.submit_lost,
          width: width,
        ),
      ),
      Container(
        padding: const EdgeInsets.fromLTRB(18, 5, 2, 10),
        width: width,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 5, 2, 10),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Select Lost Item *",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  DropdownButton<String>(
                    value: selectedItem,
                    icon: const Icon(Icons.arrow_downward),
                    hint: const Text(
                      "Select Any Of the Lost Items",
                      style: TextStyle(color: Colors.black),
                    ),
                    iconSize: 24,
                    elevation: 8,
                    style: const TextStyle(color: Colors.black),
                    underline: Container(
                      height: 2,
                      color: Colors.black,
                    ),
                    onChanged: (value) {
                      setState(() {
                        selectedItem = value!;
                      });
                    },
                    items:
                        lostitems.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            DetailField(
              label1: "First Name Indicated on Your Lost Document *",
              label2:
                  "(Please type the first name indicated on the document that got lost)",
              hintText: "First name",
              regulator: lostdocfirstnameController,
            ),
            DetailField(
              label1: "Last Name Indicated on Your Lost Document *",
              label2:
                  "(Please type the last name indicated on the document that you lost)",
              hintText: "Last Name",
              regulator: lostdoclastnameController,
            ),
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.fromLTRB(10, 5, 18, 0),
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DetailField(
              label1: "Date Of Birth",
              label2:
                  "Please add the date of birth attached to your lost document",
              hintText: "e.g 05_10_2021",
              keyboard: TextInputType.datetime,
              regulator: lostdateofbirthController,
            ),
            DetailField(
              label1: "Gender *",
              label2: "Please add the gender attached to your lost document.",
              regulator: searchinggenderController,
            ),
            DetailField(
              label1: "Nationality *",
              label2:
                  "Please add the exact nationality attached to your lost document.",
              regulator: searchingnationalityController,
            ),
          ],
        ),
      )
    ];
  }

  List<Widget> searchingpersonContact(double width) {
    return <Widget>[
      Container(
        padding: const EdgeInsets.fromLTRB(18, 5, 2, 5),
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Contact Information',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            DetailField(
              label1: "First Name *",
              label2: "Please enter your first name",
              hintText: "First Name",
              regulator: searchingfirstnameController,
            ),
            DetailField(
              label1: "Last Name",
              label2: "Please enter your last name",
              regulator: searchinglastnameController,
            ),
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.fromLTRB(10, 5, 18, 0),
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 2),
              margin: const EdgeInsets.symmetric(vertical: 10),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black87),
                  borderRadius: BorderRadius.circular(15),
                  shape: BoxShape.rectangle),
              child: IntlPhoneField(
                decoration: const InputDecoration(
                  hintText: 'Mobile Number',
                  hintStyle: TextStyle(color: Colors.black),
                  border: InputBorder.none,
                ),
                initialCountryCode: 'UG',
                onChanged: (phone) {
                  tel = phone.completeNumber;
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            DetailField(
              label1: "Email",
              label2: "Please enter your email",
              regulator: searchingemailController,
              keyboard: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      )
    ];
  }

  String selectedItem = "Student ID";

  List<String> lostitems = [
    "Student ID",
    "National ID",
    "Business ID",
    "Academic Pass Slip",
    "Academic Documents",
    "Driving Permit",
  ];

  final TextEditingController searchingitemSelected = TextEditingController();
  final TextEditingController lostdocfirstnameController =
      TextEditingController();
  final TextEditingController lostdoclastnameController =
      TextEditingController();
  final TextEditingController lostdateofbirthController =
      TextEditingController();
  final TextEditingController searchinggenderController =
      TextEditingController();
  final TextEditingController searchingnationalityController =
      TextEditingController();
  final TextEditingController searchingfirstnameController =
      TextEditingController();
  final TextEditingController searchinglastnameController =
      TextEditingController();
  final TextEditingController searchingemailController =
      TextEditingController();
  String tel = "";
  bool _subscribed = false;
  String _messageToUser = "$_youAre  NOT  $_subscri";

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                const SizedBox(height: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: searchingpersonInfo(
                    size.width,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: searchingpersonContact(
                    size.width,
                  ),
                ),
                searchsubmitButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future createAlert(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Ooops!  Network Issues"),
            content: StatefulBuilder(
              builder: (context, setState) {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(80),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                        ),
                        child: const Icon(
                          Icons.error_outlined,
                          size: 100,
                          color: Colors.yellow,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          );
        });
  }

  Future subscribeAlert(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text(
                "Ooops!   Sorry our intelligentMatching sytem didn't find any related data\n but you can subscribe to keep updated on any upcoming matching data.",
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
            content: StatefulBuilder(
              builder: (context, setState) {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(80),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                        ),
                        child: const Icon(
                          Icons.error_outline_outlined,
                          size: 100,
                          color: Colors.yellow,
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text("Subscribe"),
                          Switch(
                              value: _subscribed,
                              onChanged: (value) {
                                setState(() {
                                  _subscribed = value;
                                  _messageToUser = _youAre +
                                      (_subscribed ? "  " : " NOT ") +
                                      _subscri;
                                });
                              }),
                          Text(_messageToUser, textAlign: TextAlign.center),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        });
  }

  searchsubmitButton() {
    if (_isLoading) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.blue),
          ),
          AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText('Searching operation is in process...',
                  textStyle: const TextStyle(color: Colors.black, fontSize: 20),
                  speed: const Duration(milliseconds: 80)),
            ],
            repeatForever: true,
          )
        ],
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: RoundButton(
          height: 62,
          buttonText: "SUBMIT FOR SEARCHING",
          // backgroundColor: Colors.blue,
          onTap: () {
            if (selectedItem == "" ||
                lostdocfirstnameController.text == "" ||
                lostdoclastnameController.text == "" ||
                lostdateofbirthController.text == "" ||
                searchinggenderController.text == "" ||
                searchingnationalityController.text == "" ||
                searchingfirstnameController.text == "" ||
                searchinglastnameController.text == "" ||
                searchingemailController.text == "" ||
                tel == "") {
              Flushbar(
                message: "Empty field's found!",
                icon: const Icon(Icons.info_outline,
                    size: 25.0, color: Colors.red),
                duration: const Duration(seconds: 3),
                leftBarIndicatorColor: Colors.red,
              ).show(context);
            } else {
              setState(() {
                _isLoading = true;
              });

              save(
                  selectedItem,
                  lostdocfirstnameController.text.toUpperCase(),
                  lostdoclastnameController.text.toUpperCase(),
                  lostdateofbirthController.text.toUpperCase(),
                  searchinggenderController.text.toUpperCase(),
                  searchingnationalityController.text.toUpperCase(),
                  searchingfirstnameController.text.toUpperCase(),
                  searchinglastnameController.text.toUpperCase(),
                  searchingemailController.text,
                  tel);
            }
          },
        ),
      );
    }
  }

  // logic

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        "Access-Control_Allow_Origin": "*",
      };

  save(
      String selecteditem,
      String lostdocfirstname,
      String lostdoclastname,
      String lostdocdateofbirth,
      String searchinggender,
      String searchingnationality,
      String searchingfirstname,
      String searchinglastname,
      String searchingemail,
      String phone) async {
    Map data = {
      "selecteditem": selecteditem,
      "lostdocfirstname": lostdocfirstname,
      "lostdoclastname": lostdoclastname,
      "lostdocdateofbirth": lostdocdateofbirth,
      "searchinggender": searchinggender,
      "searchingnationality": searchingnationality,
      "searchingfirstname": searchingfirstname,
      "searchinglastname": searchinglastname,
      "searchingemail": searchingemail,
      "tel": phone
    };

    if (kDebugMode) {
      print(data);
    }
    var jsonResponse;

    var response = await http.post(
      Uri.parse("https://findabackend.herokuapp.com/public/api/search/item"),
      body: jsonEncode(data),
      headers: _setHeaders(),
    );

    if (kDebugMode) {
      print("Current Status code : ${response.statusCode}");
    }

    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);

      Searchpost searchpost = Searchpost.fromJson(jsonResponse);
      if (kDebugMode) {
        print(searchpost);
      }
      // Navigator.of(context).pushAndRemoveUntil(
      // MaterialPageRoute(
      //   builder: (BuildContext context) => SearchResult(
      //     searchpost: searchpost,
      //   ),
      // ),
      // (Route<dynamic> route) => false);

    } else {
      subscribeAlert(context).then((value) {
        setState(() {
          _isLoading = false;
        });
      });
    }
  }
}
