import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radarsofttask/app/presentation/pages/BottomBar/HomeScreen/EventDetailsScreen/screens/agenda_tab_screen.dart';
import 'package:radarsofttask/app/presentation/pages/BottomBar/HomeScreen/EventDetailsScreen/screens/event_info_screen.dart';
import 'package:radarsofttask/app/presentation/pages/BottomBar/HomeScreen/EventDetailsScreen/screens/speakers_tab_screen.dart';
import 'package:radarsofttask/app/presentation/pages/BottomBar/HomeScreen/EventDetailsScreen/screens/sponsors_tab_screen.dart';

import '../../../../../utils/responsive_layout.dart';
import '../../bottom_bar.dart';

class EventDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> eventData;

  const EventDetailsScreen({Key? key, required this.eventData}) : super(key: key);

  @override
  State<EventDetailsScreen> createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    ResponsiveLayout().init(context);

    double blockSizeHorizontal = ResponsiveLayout.blockSizeHorizontal!;
    double blockSizeVertical = ResponsiveLayout.blockSizeVertical!;

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(
            top: blockSizeVertical * 4,
            left: blockSizeHorizontal * 3,
            right: blockSizeHorizontal * 3,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.grey,
                      size: blockSizeHorizontal * 7,
                    ),
                    onPressed: () {
                      Get.to(BottomBar());
                    },
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.favorite_border_outlined,
                        color: Colors.grey,
                        size: blockSizeHorizontal * 7,
                      ),
                      SizedBox(width: blockSizeHorizontal * 2),
                      Icon(
                        Icons.messenger_outline,
                        color: Colors.grey,
                        size: blockSizeHorizontal * 7,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: blockSizeVertical * 1),
              ClipRRect(
                borderRadius: BorderRadius.circular(blockSizeHorizontal * 2.5),
                child: Image.network(
                  widget.eventData['eventBanner'],
                  width: double.infinity,
                  height: blockSizeVertical * 30,
                  fit: BoxFit.cover,
                ),
              ),
              TabBar(
                labelColor: Colors.black,
                tabs: [
                  Tab(text: 'Event Info'),
                  Tab(text: 'Agenda'),
                  Tab(text: 'Sponsors'),
                  Tab(text: 'Speakers'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    EventInfoTab(eventData: widget.eventData),
                    AgendaTab(eventData: widget.eventData),
                    SponsorsTab(eventData: widget.eventData),
                    SpeakersTab(eventData: widget.eventData),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
