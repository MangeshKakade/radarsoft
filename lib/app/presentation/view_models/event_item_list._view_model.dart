import 'package:flutter/material.dart';
import '../../data/repositories/event_List_data.dart';
import '../../models/event_list.dart';
import '../../utils/date_time_utils.dart';
import '../../utils/responsive_layout.dart';

class EventItemList extends StatefulWidget {
  final Data event;

  const EventItemList({Key? key, required this.event}) : super(key: key);

  @override
  State<EventItemList> createState() => _EventItemListState();
}

class _EventItemListState extends State<EventItemList> {
  @override
  Widget build(BuildContext context) {
    ResponsiveLayout().init(context);

    double blockSizeHorizontal = ResponsiveLayout.blockSizeHorizontal!;
    double blockSizeVertical = ResponsiveLayout.blockSizeVertical!;

    return Card(
      margin: EdgeInsets.all(blockSizeHorizontal * 3.0),
      elevation: blockSizeHorizontal * 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(blockSizeHorizontal * 2),
        side: BorderSide(
          color: Colors.grey,
          width: blockSizeHorizontal * 0.1,
        ),
      ),
      child: ListTile(
        onTap: () {
          EventListData.showEventDetails(widget.event.sId.toString());
        },
        contentPadding: EdgeInsets.all(blockSizeHorizontal * 3),
        leading: Container(
          width: blockSizeHorizontal * 25,
          decoration: ShapeDecoration(
            image: DecorationImage(
              image: NetworkImage(widget.event.eventBanner ?? ''),
              fit: BoxFit.fill,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(blockSizeHorizontal * 1.7),
            ),
          ),
        ),
        title: Text(
          widget.event.eventName ?? '',
          style: TextStyle(
            color: Colors.black,
            fontSize: blockSizeVertical * 2.0,
            fontFamily: 'Lato',
            fontWeight: FontWeight.w700,
            height: 1.2,
          ),
        ),
        subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            SizedBox(height: blockSizeVertical * 0.8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.calendar_today, color: Color(0xFF0D094D)),
                SizedBox(width: blockSizeHorizontal * 0.4),
                Text(
                  widget.event.startDate != null && widget.event.endDate != null
                      ? DateTimeUtils.formatDateRange(widget.event.startDate!, widget.event.endDate!)
                      : "",
                  style: TextStyle(
                    color: Color(0xFF0D094D),
                    fontSize: blockSizeVertical * 1.5,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.access_time, color: Color(0xFF0D094D)),
                SizedBox(width: blockSizeHorizontal * 0.4),
                Text(
                  widget.event.startDate != null && widget.event.endDate != null
                      ? DateTimeUtils.formatTimeRange(widget.event.startDate!.split(" ")[1], widget.event.endDate!.split(" ")[1])
                      : "",
                  style: TextStyle(
                    color: Color(0xFF0D094D),
                    fontSize: blockSizeVertical * 1.5,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: blockSizeVertical * 0.8),
        Row(
          children: [
            Icon(Icons.location_on, color: Color(0xFF0E0A4E)),
            SizedBox(width: blockSizeHorizontal * 0.8),
            Text(
              widget.event.location ?? '',
              style: TextStyle(
                color: Color(0xFF0E0A4E),
                fontSize: blockSizeVertical * 1.5,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        SizedBox(height: blockSizeVertical * 0.2),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
        Row(
        children: [
        Icon(Icons.person, color: Color(0xFF0D094D)),
        SizedBox(width: blockSizeHorizontal * 0.8),
        Text(
          'Booking limit - ${widget.event.bookingMaxLimit ?? ""}',
          style: TextStyle(
            color: Color(0xFF0D094D),
            fontSize: blockSizeVertical * 1.5,
            fontFamily: 'Lato',
            fontWeight: FontWeight.w400,
          ),
        ),]
      ),
      Container(
        padding: EdgeInsets.all(blockSizeHorizontal * 2.5),
        decoration: BoxDecoration(
          color: widget.event.generalInfo == "Free" ? Colors.yellow : Colors.orange,
          borderRadius: BorderRadius.circular(blockSizeHorizontal * 2),
        ),
        child: Text(
          widget.event.generalInfo ?? '',
          style: TextStyle(
            color: Colors.white,
            fontSize: blockSizeVertical * 1.6,
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
