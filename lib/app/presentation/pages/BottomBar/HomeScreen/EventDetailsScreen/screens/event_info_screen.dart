import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../constants/image_constants.dart';

class EventInfoTab extends StatelessWidget {
  final Map<String, dynamic> eventData;

  EventInfoTab({required this.eventData});

  @override
  Widget build(BuildContext context) {
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
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 5),
                    Text(
                      '${eventData['eventName']}',
                      style: const TextStyle(
                        color: Color(0xFF001833),
                        fontSize: 20,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w700,

                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFEDEDED),
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                child: IconButton(
                                  onPressed: () {

                                  },
                                  icon: const Icon(Icons.location_on_outlined, color: Color(0xFF0062CC), size: 15),
                                ),
                              ),
                            ),
                            const SizedBox(width: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: (eventData['venue'] as String).split(', ').take(2).map((line) {
                                return Text(
                                  line,
                                  style: const TextStyle(
                                    color: Color(0xFF001833),
                                    fontSize: 14,
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

                            }
                          },
                          child: const Text(
                            'View on map',
                            style: TextStyle(
                              color: Color(0xFF0062CC),
                              fontSize: 14,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.underline,
                              height: 0,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFEDEDED),
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                child: IconButton(
                                  onPressed: () {

                                  },
                                  icon: const Icon(Icons.calendar_month_sharp, color: Color(0xFF0062CC), size: 15),
                                ),
                              ),
                            ),
                            const SizedBox(width: 15),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  DateFormat('EEEE, dd MMMM, y').format(startDate),
                                  style: const TextStyle(
                                    color: Color(0xFF2B2A2A),
                                    fontSize: 16,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                  ),
                                ),
                                Text(
                                  '${DateFormat.jm().format(startDate)} - ${DateFormat.jm().format(endDate)}',
                                  style: const TextStyle(
                                    color: Color(0xFF2B2A2A),
                                    fontSize: 14,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                  ),
                                ),
                              ],
                            )

                          ],
                        ),

                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFEDEDED),
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                child: IconButton(
                                  onPressed: () {

                                  },
                                  icon: const Icon(Icons.people_rounded, color: Color(0xFF0062CC), size: 15),
                                ),
                              ),
                            ),
                            const SizedBox(width: 15),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '+${eventData['bookingMaxLimit']} going',                                             style: const TextStyle(
                                  color: Color(0xFF2B2A2A),
                                  fontSize: 14,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                                ),
                              ],
                            )
                          ],),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Attendees',
                            style: TextStyle(
                              color: Color(0xFF0062CC),
                              fontSize: 14,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.underline,
                              height: 0,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'About',
                      style: TextStyle(
                        color: Color(0xFF001833),
                        fontSize: 20,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w700,
                        height: 0.05,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      '${eventData['description']}',
                      style: const TextStyle(
                      color: Color(0xFF2B2A2A),
                      fontSize: 14,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      'Hosted by',
                      style: TextStyle(
                        color: Color(0xFF001833),
                        fontSize: 20,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w700,
                        height: 0.05,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Image.asset(
                          ImageConstants.faceImage,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: 15),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${eventData['organiserName']}',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                            const Text(
                              'Cofounder & CEO',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      'Need Help?',
                      style: TextStyle(
                        color: Color(0xFF001833),
                        fontSize: 20,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w700,
                        height: 0.05,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFEDEDED),
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.wifi_calling_sharp, color: Color(0xFF0062CC), size: 15),
                                ),
                              ),
                            ),
                            const SizedBox(width: 15),
                            const Text(
                              'Call us',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                            const SizedBox(width: 15),
                            Container(
                              height: 30,
                              width: 30,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFEDEDED),
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.textsms_outlined, color: Color(0xFF0062CC), size: 15),
                                ),
                              ),
                            ),
                            const SizedBox(width: 15),
                            const Text(
                              'Chat with us',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0x33E0DBDB),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Color(0xFFCBCBCB),
                      width: 0.40,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
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
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              '(No taxes needed)',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
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
              ),
              const SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }
}