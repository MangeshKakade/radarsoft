import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../models/event_list.dart';

class EventItem extends StatelessWidget {
  final Data event;

  EventItem({required this.event});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 0.60, color: Color(0xFFE3DDDD)),
          borderRadius: BorderRadius.circular(4),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x33000000),
            blurRadius: 1,
            offset: Offset(0, 1),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.network(event.eventBanner ?? 'https://static.vecteezy.com/system/resources/previews/005/883/254/original/page-not-found-404-error-concept-illustration-free-vector.jpg',height: 100,width: 100,), // Provide a default image URL or handle null
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.calendar_today, color: Color(0xFF0D094D)),
                      Text(
                        '${event.startDate ?? ""} - ${event.endDate ?? ""}', // Provide default values for start and end dates
                        style: TextStyle(
                          color: Color(0xFF0D094D),
                          fontSize: 12,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w400,
                          height: 0.14,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.access_time, color: Color(0xFF0D094D)),
                      Text(
                        '${event.startDate ?? ""} - ${event.endDate ?? ""}', // Provide default values for start and end times
                        style: TextStyle(
                          color: Color(0xFF0D094D),
                          fontSize: 12,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w400,
                          height: 0.14,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    event.eventName ?? '', // Provide a default event name or handle null
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w700,
                      height: 0.08,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Color(0xFF0E0A4E)),
                      Text(
                        event.venue ?? '', // Provide a default venue or handle null
                        style: TextStyle(
                          color: Color(0xFF0E0A4E),
                          fontSize: 14,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w400,
                          height: 0.10,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Booking limit - ${event.bookingMaxLimit ?? ""}', // Provide a default value for bookingMaxLimit or handle null
                    style: TextStyle(
                      color: Color(0xFF0D094D),
                      fontSize: 12,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w400,
                      height: 0.14,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.person, color: Colors.yellow),
                      Text(
                        'Free',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

