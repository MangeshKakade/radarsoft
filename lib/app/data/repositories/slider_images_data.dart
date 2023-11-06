import '../../utils/date_time_utils.dart';
import 'event_List_data.dart';


class SliderImageEventData {
  void Function(List<Map<String, String>>) updateEventData;

  SliderImageEventData({required this.updateEventData});

  Future<void> showEventDetails(String eventId) async {
    try {
      final eventList = await EventListData.fetchEventData();
      final eventData = eventList.map((event) {
        final venueLines = (event.venue ?? '').split(', ').take(1);
        final startDateFormatted = DateTimeUtils.formatDateAndTime(event.startDate ?? '');
        final location = event.location ?? '';

        return {
          'eventName': event.eventName ?? '',
          'venue': venueLines.join(', '),
          'organiserMaster': event.organiserMaster ?? '',
          'startDate': startDateFormatted,
          'location': location,
        };
      }).toList();
      updateEventData(eventData);
    } catch (e) {
      print('Error fetching event data: $e');
    }
  }
}

