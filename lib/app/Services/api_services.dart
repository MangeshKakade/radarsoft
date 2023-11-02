import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/event_list.dart';

class ApiService {
  static const String eventListUrl = "https://gathrr.radarsofttech.in:5050/dummy/event-list";

  // Add a method to fetch event data
  static Future<Data> fetchEventData() async {
    final response = await http.get(Uri.parse(eventListUrl));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return Data.fromJson(jsonData); // Assuming your data is in JSON format
    } else {
      throw Exception("Failed to load event data");
    }
  }
}
