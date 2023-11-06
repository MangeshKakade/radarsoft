import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../../constants/image_constants.dart';
import '../../../../../../utils/responsive_layout.dart';

class EventInfoTab extends StatelessWidget {
  final Map<String, dynamic> eventData;

  EventInfoTab({required this.eventData});

  @override
  Widget build(BuildContext context) {
    ResponsiveLayout().init(context);

    double blockSizeHorizontal = ResponsiveLayout.blockSizeHorizontal!;
    double blockSizeVertical = ResponsiveLayout.blockSizeVertical!;

    DateTime startDate = DateTime.parse(eventData['startDate']);
    DateTime endDate = DateTime.parse(eventData['endDate']);

    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(blockSizeHorizontal * 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: blockSizeVertical * 1),
                    Text(
                      '${eventData['eventName']}',
                      style: TextStyle(
                        color: Color(0xFF001833),
                        fontSize: blockSizeHorizontal * 4,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: blockSizeVertical * 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: blockSizeVertical * 3.8,
                              width: blockSizeVertical * 3.8,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFEDEDED),
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.location_on_outlined,
                                    color: Color(0xFF0062CC),
                                    size: blockSizeHorizontal * 3,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: blockSizeHorizontal * 2.5),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: (eventData['venue'] as String).split(', ').take(2).map((line) {
                                return Text(
                                  line,
                                  style: TextStyle(
                                    color: Color(0xFF001833),
                                    fontSize: blockSizeHorizontal * 3.2,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w700,
                                    height: 1.0,
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () async {
                            String mapLink = eventData['locationMapLink'];
                            if (await canLaunch(mapLink)) {
                              await launch(mapLink);
                            } else {
                              // Handle the error
                            }
                          },
                          child: Text(
                            'View on map',
                            style: TextStyle(
                              color: Color(0xFF0062CC),
                              fontSize: blockSizeHorizontal * 3.2,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.underline,
                              height: 0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: blockSizeVertical * 1.5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: blockSizeVertical * 3.8,
                              width: blockSizeVertical * 3.8,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFEDEDED),
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.calendar_month_sharp,
                                    color: Color(0xFF0062CC),
                                    size: blockSizeHorizontal * 3,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: blockSizeHorizontal * 2),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  DateFormat('EEEE, dd MMMM, y').format(startDate),
                                  style: TextStyle(
                                    color: Color(0xFF2B2A2A),
                                    fontSize: blockSizeHorizontal * 3.2,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                  ),
                                ),
                                Text(
                                  '${DateFormat.jm().format(startDate)} - ${DateFormat.jm().format(endDate)}',
                                  style: TextStyle(
                                    color: Color(0xFF2B2A2A),
                                    fontSize: blockSizeHorizontal * 3,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: blockSizeVertical * 1.5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: blockSizeVertical * 3.8,
                              width: blockSizeVertical * 3.8,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFEDEDED),
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.people_rounded,
                                    color: Color(0xFF0062CC),
                                    size: blockSizeHorizontal * 3,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: blockSizeHorizontal * 2),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '+${eventData['bookingMaxLimit']} going',
                                  style: TextStyle(
                                    color: Color(0xFF2B2A2A),
                                    fontSize: blockSizeHorizontal * 3.3,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Attendees',
                            style: TextStyle(
                              color: Color(0xFF0062CC),
                              fontSize: blockSizeHorizontal * 3.2,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.underline,
                              height: 0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: blockSizeVertical * 4),
                    Text(
                      'About',
                      style: TextStyle(
                        color: Color(0xFF001833),
                        fontSize: blockSizeHorizontal * 4,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w700,
                        height: 0.05,
                      ),
                    ),
                    SizedBox(height: blockSizeVertical * 3),
                    Text(
                      '${eventData['description']}',
                      style: TextStyle(
                        color: Color(0xFF2B2A2A),
                        fontSize: blockSizeHorizontal * 3,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    SizedBox(height: blockSizeVertical * 6),
                    Text(
                      'Hosted by',
                      style: TextStyle(
                        color: Color(0xFF001833),
                        fontSize: blockSizeHorizontal * 4,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w700,
                        height: 0.05,
                      ),
                    ),
                    SizedBox(height: blockSizeVertical * 4),
                    Row(
                      children: [
                        Image.asset(
                          ImageConstants.faceImage,
                          fit: BoxFit.cover,
                          width: blockSizeHorizontal * 12,
                          height: blockSizeVertical * 6,
                        ),
                        SizedBox(width: blockSizeHorizontal * 2),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${eventData['organiserName']}',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: blockSizeHorizontal * 4,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                            Text(
                              'Cofounder & CEO',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: blockSizeHorizontal * 3.5,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: blockSizeVertical * 6),
                    Text(
                      'Need Help?',
                      style: TextStyle(
                        color: Color(0xFF001833),
                        fontSize: blockSizeHorizontal * 5,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w700,
                        height: 0.05,
                      ),
                    ),
                    SizedBox(height: blockSizeVertical * 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: blockSizeVertical * 3.8,
                              width: blockSizeVertical * 3.8,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFEDEDED),
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.wifi_calling_sharp,
                                    color: Color(0xFF0062CC),
                                    size: blockSizeHorizontal * 3,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: blockSizeHorizontal * 2.5),
                            Text(
                              'Call us',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: blockSizeHorizontal * 4,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                            SizedBox(width: blockSizeHorizontal * 3),
                            Container(
                              height: blockSizeVertical * 3.8,
                              width: blockSizeVertical * 3.8,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFEDEDED),
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.textsms_outlined,
                                    color: Color(0xFF0062CC),
                                    size: blockSizeHorizontal * 3,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: blockSizeHorizontal * 2.5),
                            Text(
                              'Chat with us',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: blockSizeHorizontal * 4,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: blockSizeVertical * 4),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0x33E0DBDB),
                  borderRadius: BorderRadius.circular(blockSizeHorizontal * 4),
                  border: Border.all(
                    color: Color(0xFFCBCBCB),
                    width: blockSizeHorizontal * 0.4,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(blockSizeHorizontal * 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${eventData['generalInfo']}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: blockSizeHorizontal * 5,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                          SizedBox(height: blockSizeVertical * 0.8),
                          Text(
                            '(No taxes needed)',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: blockSizeHorizontal * 3,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF004999),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Register now',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: blockSizeVertical * 2),
            ],
          ),
        ],
      ),
    );
  }
}