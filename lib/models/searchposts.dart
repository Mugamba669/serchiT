// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

List<Searchpost> searchpostFromJson(String str) =>
    List<Searchpost>.from(json.decode(str).map((x) => Searchpost.fromJson(x)));

String searchpostToJson(List<Searchpost> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Searchpost {
  Searchpost({
    this.id,
    this.selecteditem,
    this.docfirstname,
    this.doclastname,
    this.dateofbirth,
    this.gender,
    this.nationality,
    this.location,
    this.firstname,
    this.lastname,
    this.email,
    this.phone,
    this.pic,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? selecteditem;
  String? docfirstname;
  String? doclastname;
  String? dateofbirth;
  String? gender;
  String? nationality;
  String? location;
  String? firstname;
  String? lastname;
  String? email;
  String? phone;
  String? pic;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Searchpost.fromJson(Map<String?, dynamic> json) => Searchpost(
        id: json["id"] as int,
        selecteditem: json["selecteditem"],
        docfirstname: json["docfirstname"],
        doclastname: json["doclastname"],
        dateofbirth: json["dateofbirth"],
        gender: json["gender"],
        nationality: json["nationality"],
        location: json["location"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        email: json["email"],
        phone: json["phone"],
        pic: json["pic"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
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
        "pic": pic,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
