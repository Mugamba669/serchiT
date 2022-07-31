import 'package:flutter/material.dart';

class BottomBarColumn extends StatelessWidget {
  final String? heading;
  final String? s1;
  final String? s2;
  final String? s3;

  const BottomBarColumn({
    Key? key,
    this.heading,
    this.s1,
    this.s2,
    this.s3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading!,
            style: TextStyle(
                color: Colors.blueGrey[300],
                fontSize: 18,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            s1!,
            style: const TextStyle(
                color: Colors.blue, fontSize: 14, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            s2!,
            style: const TextStyle(
                color: Colors.blue, fontSize: 14, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            s3!,
            style: const TextStyle(
                color: Colors.blue, fontSize: 14, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
