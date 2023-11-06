import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../api/api_config.dart';
import '../../models/event_list.dart';
import '../../presentation/pages/BottomBar/HomeScreen/EventDetailsScreen/event_details_screen.dart';

class EventListData {
  static const String eventListUrl = ApiConstants.eventListUrl;

  static Future<List<Data>> fetchEventData() async {
    final response = await http.get(Uri.parse(eventListUrl));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final eventListData = EventList.fromJson(jsonData);
      return eventListData.data ?? [];
    } else {
      throw Exception('Failed to fetch event data');
    }
  }

  static Future<void> showEventDetails(String eventId) async {
    final url = '${ApiConstants.baseUrl}/event-details/$eventId';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final eventData = json.decode(response.body)['data'];
        Get.to(EventDetailsScreen(eventData: eventData));
      } else {
        throw Exception('Failed to load event details');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
