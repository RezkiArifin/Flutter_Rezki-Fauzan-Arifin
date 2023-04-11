// To parse this JSON data, do
//
//     final ContactInfoResponse = contactInfoResponseFromJson(jsonString);

import 'dart:convert';

ContactInfoResponse contactInfoResponseFromJson(String str) =>
    ContactInfoResponse.fromJson(json.decode(str));

String contactInfoResponseToJson(ContactInfoResponse data) =>
    json.encode(data.toJson());

class ContactInfoResponse {
  ContactInfoResponse({
    required this.id,
    required this.name,
    required this.phone,
  });

  int id;
  String name;
  String phone;

  factory ContactInfoResponse.fromJson(Map<String, dynamic> json) =>
      ContactInfoResponse(
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
