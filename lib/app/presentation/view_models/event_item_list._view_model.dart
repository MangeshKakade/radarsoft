import 'package:flutter/material.dart';
import '../../data/repositories/event_List_data.dart';
import '../../models/event_list.dart';
import '../../utils/date_time_utils.dart';

class EventItemList extends StatefulWidget {
  final Data event;

  const EventItemList({Key? key, required this.event}) : super(key: key);

  @override
  State<EventItemList> createState() => _EventItemListState();
}

class _EventItemListState extends State<EventItemList> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey, width: 1.0),
      ),
      child: ListTile(
        onTap: () {
          EventListData.showEventDetails(widget.event.sId.toString());
        },
        contentPadding: const EdgeInsets.all(12),
        leading: Container(
          width: 100,
          decoration: ShapeDecoration(
            image: DecorationImage(
              image: NetworkImage(widget.event.eventBanner ?? ''),
              fit: BoxFit.fill,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
        title: Text(
          widget.event.eventName ?? '',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontFamily: 'Lato',
            fontWeight: FontWeight.w700,
            height: 1.2,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.calendar_today, color: Color(0xFF0D094D)),
                    const SizedBox(width: 4),
                    Text(
                      widget.event.startDate != null && widget.event.endDate != null
                          ? DateTimeUtils.formatDateRange(widget.event.startDate!, widget.event.endDate!)
                          : "",
                      style: const TextStyle(
                        color: Color(0xFF0D094D),
                        fontSize: 12,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.access_time, color: Color(0xFF0D094D)),
                    const SizedBox(width: 4),
                    Text(
                      widget.event.startDate != null && widget.event.endDate != null
                          ? DateTimeUtils.formatTimeRange(widget.event.startDate!.split(" ")[1], widget.event.endDate!.split(" ")[1])
                          : "",
                      style: const TextStyle(
                        color: Color(0xFF0D094D),
                        fontSize: 12,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.location_on, color: Color(0xFF0E0A4E)),
                const SizedBox(width: 8),
                Text(
                  widget.event.location ?? '',
                  style: const TextStyle(
                    color: Color(0xFF0E0A4E),
                    fontSize: 14,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.person, color: Color(0xFF0D094D)),
                    const SizedBox(width: 8),
                    Text(
                      'Booking limit - ${widget.event.bookingMaxLimit ?? ""}',
                      style: const TextStyle(
                        color: Color(0xFF0D094D),
                        fontSize: 12,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: widget.event.generalInfo == "Free" ? Colors.yellow : Colors.orange,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    widget.event.generalInfo ?? '',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
