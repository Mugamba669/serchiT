// ignore_for_file: prefer_interpolation_to_compose_strings, import_of_legacy_library_into_null_safe, library_private_types_in_public_api, depend_on_referenced_packages, deprecated_member_use, unnecessary_null_comparison, prefer_typing_uninitialized_variables

import 'dart:io';
import 'dart:typed_data';
import 'dart:async';
import 'package:finda/components/Loader.dart';
import 'package:finda/components/Space.dart';
import 'package:finda/models/LocalFiles.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:http_parser/http_parser.dart';

import 'package:finda/components/rounded_button.dart';
import 'package:finda/components/detail_fields.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:http/http.dart' as http;

class SubmitItem extends StatefulWidget {
  const SubmitItem({Key? key}) : super(key: key);

  @override
  _SubmitItemState createState() => _SubmitItemState();
}

class _SubmitItemState extends State<SubmitItem> {
  @override
  void initState() {
    super.initState();

    // Hive.init("${Directory.current.path}stoarge/emulated/0/");
  }

  ImagePicker imagePicker = ImagePicker();
  List<Widget> lostInfo(double width) {
    return <Widget>[
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0),
        child: Image.asset(
          Localfiles.submit_found,
          width: width,
        ),
      ),
    ];
  }

  List<Widget> lostDetails(double width) {
    return <Widget>[
      Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 5, 2, 10),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Choose Lost Item *",
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
                  elevation: 10,
                  style: const TextStyle(color: Colors.black),
                  underline: Container(
                    height: 2,
                    color: Colors.black,
                  ),
                  onChanged: (value) {
                    setState(() {
                      selectedItem = value!;
                    });
                    if (kDebugMode) {
                      print(value);
                    }
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
            label1: "Name Indicated on Found Document *",
            label2:
                "(Please type the first name indicated on the document you have picked)",
            hintText: "document name",
            regulator: docfirstnameController,
          ),
        ],
      ),
      Container(
        padding: const EdgeInsets.fromLTRB(10, 5, 18, 0),
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DetailField(
              label1: "Nationality *",
              label2:
                  "Please add the exact nationality attached to the found item.",
              regulator: nationalityController,
            ),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "Upload image",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  if (imgCover != null)
                    Card(
                        child: Image.memory(
                      _bytesData,
                      width: width / 4,
                      height: width / 5,
                      fit: BoxFit.cover,
                    )),
                  InkWell(
                    onTap: startWebFilePicker,
                    child: const CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 30,
                      child: Center(
                        child: Icon(Icons.upload_file),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )
    ];
  }

  var imgCover;

  // method for selecting image
  startWebFilePicker() async {
    // var box = await Hive.openBox("searchIt");

    final image = await imagePicker.getImage(source: ImageSource.gallery);

    if (image != null) {
      imgCover = await image.readAsBytes();

      // box.put(docfirstnameController.text, imgCover);
      // box.get(docfirstnameController.text);
      // setState(() {
      _bytesData = await image.readAsBytes();

      _selectedFile = _bytesData;
    }
  }

  // showMsg() {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     const SnackBar(
  //       behavior: SnackBarBehavior.floating,
  //       content: Text("Image Uploaded"),
  //       duration: Duration(seconds: 4),
  //     ),
  //   );
  // }

  List<Widget> lostDetails2(double width) {
    return <Widget>[
      Container(
        padding: const EdgeInsets.fromLTRB(18, 5, 2, 0),
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Location Information',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 10,
            ),
            DetailField(
              label1: "Where Lost *",
              label2:
                  "Please provide an approximate location of the lost property (University Canteens, Restaurant, Parking Yard, etc.)",
              hintText: "Item's Lost Location",
              regulator: locationController,
            ),
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SizedBox(
              height: 30,
            ),
            DetailField(
              label1: "More Location Informattion",
              label2:
                  "Please enhance the location description of the lost property. But it's optional",
              hintText: "You can add additional location information",
            ),
          ],
        ),
      )
    ];
  }

  List<Widget> lostDetails3(double width) {
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
              label1: "Name *",
              label2:
                  "Please enter your name(This will appear on your submission)",
              hintText: " Name",
              regulator: firstnameController,
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
            Center(
              child: Container(
                width: width / 1.3,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black87),
                    borderRadius: BorderRadius.circular(10),
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
            ),
            Space(),
            DetailField(
              label1: "Email *",
              label2:
                  "Please enter your email(This will appear on your submission)",
              regulator: emailController,
              keyboard: TextInputType.emailAddress,
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

  // variable to hold image to be displayed

  late List<int> _selectedFile;
  late Uint8List _bytesData;

  final TextEditingController docfirstnameController = TextEditingController();
  final TextEditingController doclastnameController = TextEditingController();
  final TextEditingController dateofbirthController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController nationalityController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  String tel = "";

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
                  children: lostInfo(
                    size.width,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: lostDetails(
                    size.width,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: lostDetails2(
                    size.width,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: lostDetails3(
                    size.width,
                  ),
                ),
                submitButton(),
                const SizedBox(
                  height: 10,
                ),
                // Bottombarmobile(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future createAlert(BuildContext context, bool error, String msg) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(msg,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
            content: StatefulBuilder(
              builder: (context, setState) {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 60,
                        child: Icon(
                          error ? Icons.warning_amber_rounded : Icons.check,
                          size: 60,
                          color: Colors.yellow,
                        ),
                      ),
                      RoundButton(
                        buttonText: "Okay",
                        onTap: () => Navigator.of(context).pop(),
                      )
                    ],
                  ),
                );
              },
            ),
          );
        });
  }

  submitButton() {
    return _isLoading
        ? Loader(
            message: "Submission in progress",
          )
        : RoundButton(
            padding: const EdgeInsets.all(20),
            height: 62,
            buttonText: "SUBMIT",
            onTap: () {
              if (selectedItem == "" ||
                  docfirstnameController.text == "" ||
                  nationalityController.text == "" ||
                  locationController.text == "" ||
                  firstnameController.text == "" ||
                  emailController.text == "" ||
                  tel == "") {
                Flushbar(
                  message: "Empty fields found!",
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
                    docfirstnameController.text.toUpperCase(),
                    "doclastnameController",
                    "dateofbirthController",
                    "genderController",
                    nationalityController.text.toUpperCase(),
                    locationController.text.toUpperCase(),
                    firstnameController.text.toUpperCase(),
                    "lastnameController",
                    emailController.text,
                    tel,
                    _selectedFile);
              }
            },
          );
  }

  // logic

  save(
      String selecteditem,
      String docfirstname,
      String doclastname,
      String dateofbirth,
      String gender,
      String nationality,
      String location,
      String firstname,
      String lastname,
      String email,
      String phone,
      List<int> selectedFile) {
    var request = http.MultipartRequest('POST',
        Uri.parse("https://findabackend.herokuapp.com/public/api/submit/file"));
    var data = {
      "selecteditem": selecteditem,
      "docfirstname": docfirstname,
      "doclastname": doclastname,
      "dateofbirth": dateofbirth,
      "gender": gender,
      "nationality": nationality,
      "location": location,
      "firstname": firstname,
      "lastname": lastname,
      "email": email,
      "phone": phone,
    };
    if (kDebugMode) {
      print(data);
    }
    request.fields.addAll(data);
    request.files.add(http.MultipartFile.fromBytes('pic', selectedFile,
        contentType: MediaType('application', 'octet-stream'),
        filename: "fileName"));

    request.send().then((response) {
      if (kDebugMode) {
        print(response.statusCode);
      }
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print("Uploaded!");
        }
        createAlert(context, false,
                'Thank You for Submitting the ' + selectedItem + " found.")
            .then((value) {
          setState(() {
            _isLoading = false;
          });
        });
      } else {
        createAlert(
                context, true, "Not saved. status code: ${response.statusCode}")
            .then((value) {
          setState(() {
            _isLoading = false;
          });
        });
      }
    });
  }
}
