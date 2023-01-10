// To parse this JSON data, do
//
//     final guest = guestFromJson(jsonString);

import 'dart:convert';

class Guest {
  Guest({
    this.id,
    this.name,
    this.imageUrl,
    this.country,
  });

  int? id;
  String? name;
  String? imageUrl;
  String? country;

  factory Guest.fromRawJson(String str) => Guest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Guest.fromJson(Map<String, dynamic> json) => Guest(
        id: json["id"],
        name: json["name"],
        imageUrl: json["imageUrl"],
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "imageUrl": imageUrl,
        "country": country,
      };
}
