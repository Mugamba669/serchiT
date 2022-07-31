import 'package:finda/components/Space.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DetailField extends StatelessWidget {
  final TextEditingController? regulator;
  final TextInputType? keyboard;
  final String? hintText;
  final String? label1;
  final String? label2;
  const DetailField({
    Key? key,
    this.regulator,
    this.hintText,
    this.label1,
    this.label2,
    this.keyboard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 2),
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: const BoxDecoration(
        color: Colors.white70,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label1!,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Text(label2!),
          const SizedBox(
            height: 3,
          ),
          TextField(
            controller: regulator,
            enableSuggestions: true,
            showCursor: true,
            keyboardType: keyboard,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2.0)),
                hintText: hintText,
                hintStyle: const TextStyle(color: Colors.black)),
          ),
          Space()
        ],
      ),
    );
  }
}
