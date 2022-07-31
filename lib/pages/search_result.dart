// // ignore_for_file: unused_local_variable

// import '../components/bottom_bar.dart';
// import '../components/mobile_bottom_bar.dart';
// import '../components/rounded_button.dart';
// import '../models/searchposts.dart';
// import '../responsive.dart';
// import '../pages/full_search_result.dart';
// import 'package:flutter/material.dart';
// import 'package:flutterwave/flutterwave.dart';
// // import 'dart:html';
// // import 'package:universal_ui/universal_ui.dart';

// class SearchResult extends StatefulWidget {
//   final Searchpost searchpost;
//   SearchResult({Key key, @required this.searchpost}) : super(key: key);

//   @override
//   _SearchResultState createState() => _SearchResultState();
// }

// class _SearchResultState extends State<SearchResult> {
//   @override
  // void initState() {
  //   Flutterwave.initialize(
  //       'FLWPUBK_TEST-919310eeadea8375f2576a0b91c3f252-X');
  //   super.initState();
  // }

//   void _makePayment() async {
//     final customer = FlutterwaveCustomer(
//         'arnoldrutanana@gmail.com', '+256770438052', 'Rutanana Arnold');
//     final charge = new Charge()
//       ..amount = 100
//       ..reference = 'test'
//       ..currency = 'UGX'
//       ..country = 'UG'
//       ..customer = customer;

//     final response = await FlutterwaveWebClient.checkout(charge: charge);

//   final Customer customer = Customer(
// 	    name: "FLW Developer", 
// 	    phoneNumber: "1234566677777", 
// 	    email: "customer@customer.com"
// 	    );  
	    
// final Flutterwave flutterwave = Flutterwave(
// 	    context: context, 
// 	    style: style, 
// 	    publicKey: "Public Key", 
// 	    currency: "RWF", 
// 	    redirectUrl: "my_redirect_url" 
// 	    txRef: "unique_transaction_reference", 
// 	    amount: "3000", 
// 	    customer: customer, 
// 	    paymentOptions: "ussd, card, barter, payattitude", 
// 	    customization: Customization(title: "Test Payment"),
// 	    isDebug: true
// 	    ); 

    // if (response == null) {
    //   await Navigator.of(context).push(
    //     MaterialPageRoute(
    //       builder: (BuildContext context) => FullSearchResult(
    //         searchpost: widget.searchpost,
    //       ),
    //     ),
    //   );
    //   print(widget.searchpost);
    //   print('Successful, Transaction ref ${response.tx_ref}');
    //   print(response.status);
    // } else {
//       await Navigator.of(context).push(
//         MaterialPageRoute(
//           builder: (BuildContext context) => FullSearchResult(
//             searchpost: widget.searchpost,
//           ),
//         ),
//       );
//       print('Transaction failed');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
    // ui.platformViewRegistry.registerViewFactory(
    //     'image-html',
    //     (int viewId) => ImageElement()
    //       ..src = "https://findabackend.herokuapp.com/public/docImages/" +
    //           "${widget.searchpost.pic}"
    //       ..style.border = 'none');

//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Finda..."),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Flexible(
//                   child: Text(
//                     "Matched document according to what you have provided to us!!",
//                     style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 SizedBox(
//                   width: 20.0,
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 10.0,
//             ),
//             SizedBox(
//               width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.height * 0.7,
//               child: Card(
//                 child: HtmlElementView(viewType: 'image-html'),
//                 elevation: 8,
//                 margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
//               ),
//             ),
//             SizedBox(
//               height: 10.0,
//             ),
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Flexible(
//                   child: Text(
//                     "First Name attached:",
//                     style:
//                         TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
//                   ),
//                 ),
//                 SizedBox(
//                   width: 20.0,
//                 ),
//                 Flexible(
//                   child: Text(
//                     "${widget.searchpost.docfirstname}",
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 10.0,
//             ),
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Flexible(
//                   child: Text(
//                     "Last Name attached:",
//                     style:
//                         TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
//                   ),
//                 ),
//                 SizedBox(
//                   width: 20.0,
//                 ),
//                 Flexible(
//                   child: Text(
//                     "${widget.searchpost.doclastname}",
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 10.0,
//             ),
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Flexible(
//                   child: Text(
//                     "Date of Birth attached:",
//                     style:
//                         TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
//                   ),
//                 ),
//                 SizedBox(
//                   width: 20.0,
//                 ),
//                 Flexible(
//                   child: Text(
//                     "${widget.searchpost.dateofbirth}",
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 10.0,
//             ),
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Flexible(
//                   child: Text(
//                     "Gender attached:",
//                     style:
//                         TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
//                   ),
//                 ),
//                 SizedBox(
//                   width: 20.0,
//                 ),
//                 Flexible(
//                   child: Text(
//                     "${widget.searchpost.gender}",
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 10.0,
//             ),
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Flexible(
//                   child: Text(
//                     "Nationality attached:",
//                     style:
//                         TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
//                   ),
//                 ),
//                 SizedBox(
//                   width: 20.0,
//                 ),
//                 Flexible(
//                   child: Text(
//                     "${widget.searchpost.nationality}",
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 10.0,
//             ),
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Flexible(
//                   child: Text(
//                     "Location in which item was found:",
//                     style:
//                         TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
//                   ),
//                 ),
//                 SizedBox(
//                   width: 20.0,
//                 ),
//                 Flexible(
//                   child: Text(
//                     "${widget.searchpost.location}",
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 10.0,
//             ),
//             Container(
//               child: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Text(
//                     "You need to pay first inorder to access full details and the contact of the person who posted",
//                     style: TextStyle(
//                       fontSize: 18,
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(
//                     width: 50,
//                   ),
//                   RoundButton(
//                     text: "Initiate Payment",
//                     press: _makePayment,
//                     color: Colors.blue,
//                   ),
//                 ],
//               ),
//             ),
//             ResponsiveWidget.isMobileScreen(context)
//                 ? Bottombarmobile()
//                 : BottomBar()
//           ],
//         ),
//       ),
//     );
//   }
// }
