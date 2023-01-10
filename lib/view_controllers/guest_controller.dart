import 'dart:convert';
import 'package:bukit_vista_flutter_assessment/models/guest_list_model.dart';
import 'package:flutter/services.dart' as rootBundle;

Future<List<Guest>> readGuestJsonData() async {
  final guestJsonData =
      await rootBundle.rootBundle.loadString('lib/json_file/guest_list.json');
  final guestAsList = await json.decode(guestJsonData) as List<dynamic>;
  return guestAsList.map((guest) => Guest.fromJson(guest)).toList();
}
