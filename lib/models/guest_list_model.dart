// To parse this JSON data, do
//
//     final guest = guestFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

class Guest extends Equatable {
  Guest({
    this.id,
    this.name,
    this.imageUrl,
    this.country,
    this.accommodation,
    this.checkInTime,
    this.checkInDate,
    this.checkOutTime,
    this.checkOutDate,
    this.nights,
    this.bookingId,
    this.bookingStatus,
    this.numberOfGuest,
    this.bookingValue,
    this.phoneNumber,
    this.hostingDetails,
  });

  int? id;
  String? name;
  String? imageUrl;
  String? country;
  String? accommodation;
  String? checkInTime;
  String? checkInDate;
  String? checkOutTime;
  String? checkOutDate;
  String? nights;
  String? bookingId;
  String? bookingStatus;
  String? numberOfGuest;
  String? bookingValue;
  String? phoneNumber;
  HostingDetails? hostingDetails;

  factory Guest.fromRawJson(String str) => Guest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Guest.fromJson(Map<String, dynamic> json) => Guest(
        id: json["id"],
        name: json["name"],
        imageUrl: json["imageUrl"],
        country: json["country"],
        accommodation: json["accommodation"],
        checkInTime: json["checkInTime"],
        checkInDate: json["checkInDate"],
        checkOutTime: json["checkOutTime"],
        checkOutDate: json["checkOutDate"],
        nights: json["nights"],
        bookingId: json["bookingId"],
        bookingStatus: json["bookingStatus"],
        numberOfGuest: json["numberOfGuest"],
        bookingValue: json["bookingValue"],
        phoneNumber: json["phoneNumber"],
        hostingDetails: HostingDetails.fromJson(json["hostingDetails"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "imageUrl": imageUrl,
        "country": country,
        "accommodation": accommodation,
        "checkInTime": checkInTime,
        "checkInDate": checkInDate,
        "checkOutTime": checkOutTime,
        "checkOutDate": checkOutDate,
        "nights": nights,
        "bookingId": bookingId,
        "bookingStatus": bookingStatus,
        "numberOfGuest": numberOfGuest,
        "bookingValue": bookingValue,
        "phoneNumber": phoneNumber,
        "hostingDetails": hostingDetails!.toJson(),
      };

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class HostingDetails extends Equatable {
  HostingDetails({
    this.host,
    this.profileName,
    this.propertyUnit,
    this.listingName,
  });

  String? host;
  String? profileName;
  String? propertyUnit;
  String? listingName;

  factory HostingDetails.fromRawJson(String str) =>
      HostingDetails.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HostingDetails.fromJson(Map<String, dynamic> json) => HostingDetails(
        host: json["host"],
        profileName: json["profileName"],
        propertyUnit: json["propertyUnit"],
        listingName: json["listingName"],
      );

  Map<String, dynamic> toJson() => {
        "host": host,
        "profileName": profileName,
        "propertyUnit": propertyUnit,
        "listingName": listingName,
      };

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
