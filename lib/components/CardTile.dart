// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';

class CardTile extends StatelessWidget {
  String? label;
  String? name;
  Widget trailer;
  IconData? icon;
  CardTile(
      {Key? key,
      this.label,
      this.name,
      this.trailer = const SizedBox(),
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: ListTile(
          trailing: trailer,
          title: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Text(label ?? ""),
          ),
          leading: Icon(icon),
          subtitle: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text(name ?? ""),
          ),
        ),
      ),
    );
  }
}
