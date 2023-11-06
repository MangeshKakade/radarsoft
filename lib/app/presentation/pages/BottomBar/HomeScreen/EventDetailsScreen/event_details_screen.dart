import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radarsofttask/app/presentation/pages/BottomBar/HomeScreen/EventDetailsScreen/screens/agenda_tab_screen.dart';
import 'package:radarsofttask/app/presentation/pages/BottomBar/HomeScreen/EventDetailsScreen/screens/event_info_screen.dart';
import 'package:radarsofttask/app/presentation/pages/BottomBar/HomeScreen/EventDetailsScreen/screens/speakers_tab_screen.dart';
import 'package:radarsofttask/app/presentation/pages/BottomBar/HomeScreen/EventDetailsScreen/screens/sponsors_tab_screen.dart';

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
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(top: 40,left: 15,right: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.grey, size: 30),
                    onPressed: () {
                      Get.to(BottomBar());
                    },
                  ),
                  const Row(
                    children: [
                      Icon(Icons.favorite_border_outlined, color: Colors.grey, size: 30),
                      SizedBox(width: 12),
                      Icon(Icons.messenger_outline, color: Colors.grey, size: 30),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10,),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  widget.eventData['eventBanner'],
                  width: double.infinity,
                  height: 200,
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








