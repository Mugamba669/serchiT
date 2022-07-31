// To parse this JSON data, do
//
//     final recentpost = recentpostFromJson(jsonString);

import 'dart:convert';

List<Recentpost> recentpostFromJson(String str) =>
    List<Recentpost>.from(json.decode(str).map((x) => Recentpost.fromJson(x)));

String recentpostToJson(List<Recentpost> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Recentpost {
  Recentpost({
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

  factory Recentpost.fromJson(Map<String, dynamic> json) => Recentpost(
        id: json["id"],
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
