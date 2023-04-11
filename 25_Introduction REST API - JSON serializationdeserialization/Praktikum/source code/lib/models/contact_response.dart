// To parse this JSON data, do
//
//     final contactResponse = contactResponseFromJson(jsonString);

import 'dart:convert';

List<ContactResponse> contactResponseFromJson(String str) =>
    List<ContactResponse>.from(
        json.decode(str).map((x) => ContactResponse.fromJson(x)));

String contactResponseToJson(List<ContactResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ContactResponse {
  ContactResponse({
    this.id,
    this.name,
    this.phone,
  });

  int? id;
  String? name;
  String? phone;

  factory ContactResponse.fromJson(Map<String, dynamic> json) =>
      ContactResponse(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
      };
}
