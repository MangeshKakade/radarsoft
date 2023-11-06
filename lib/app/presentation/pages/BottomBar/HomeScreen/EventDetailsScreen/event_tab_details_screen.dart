// import 'package:flutter/material.dart';
// import 'package:radarsofttask/app/presentation/pages/BottomBar/HomeScreen/EventDetailsScreen/screens/agenda_tab_screen.dart';
// import 'package:radarsofttask/app/presentation/pages/BottomBar/HomeScreen/EventDetailsScreen/screens/event_info_screen.dart';
// import 'package:radarsofttask/app/presentation/pages/BottomBar/HomeScreen/EventDetailsScreen/screens/speakers_tab_screen.dart';
// import 'package:radarsofttask/app/presentation/pages/BottomBar/HomeScreen/EventDetailsScreen/screens/sponsors_tab_screen.dart';
//
// class EventTabs extends StatelessWidget {
//   final Map<String, dynamic> eventData;
//
//   EventTabs({required this.eventData});
//
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 4, // Number of tabs
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Event Details'),
//           bottom: TabBar(
//             tabs: [
//               Tab(text: 'Event Info'),
//               Tab(text: 'Agenda'),
//               Tab(text: 'Sponsors'),
//               Tab(text: 'Speakers'),
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: [
//             // Tab 1: Event Info
//             EventInfoTab(eventData: eventData),
//
//             // Tab 2: Agenda
//             AgendaTab(eventData: eventData),
//
//             // Tab 3: Sponsors
//             SponsorsTab(eventData: eventData),
//
//             // Tab 4: Speakers
//             SpeakersTab(eventData: eventData),
//           ],
//         ),
//       ),
//     );
//   }
// }
