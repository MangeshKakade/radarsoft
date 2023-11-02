  import 'package:flutter/material.dart';
  import 'package:intl/intl.dart';
  import 'package:radarsofttask/app/presentation/pages/BottomBar/HomeScreen/Event/event_list.dart';

import '../../../../Services/api_services.dart';
import '../../../../models/event_list.dart';

  class HomeScreen extends StatefulWidget {
    const HomeScreen({Key? key}) : super(key: key);

    @override
    State<HomeScreen> createState() => _HomeScreenState();
  }

  class _HomeScreenState extends State<HomeScreen> {
    String selectedCategory = "All events"; // Default selected category
    late Future<Data> eventData; // Declare eventData as a Future

    @override
    void initState() {
      super.initState();
      eventData = ApiService.fetchEventData(); // Fetch event data when the widget initializes
    }

    @override
    Widget build(BuildContext context) {
      final now = DateTime.now();
      final formattedDate = DateFormat('EEEE, dd MMMM').format(now);

      // Initialize selectedContent with an empty Container
      Widget selectedContent = Container();

      // Define the content for the "All events" category
      Widget allEventsContent = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Add content specific to the "All events" category here
          Text(
            'All Events Content',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
        ],
      );

      // Create a variable to hold the selected content based on the category
      if (selectedCategory == "All events") {
        selectedContent = allEventsContent;
      }
      // Add more conditions for other categories here

      return Scaffold(
        body: ListView(
          padding: EdgeInsets.only(top: 50, left: 15, right: 15),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 32),
                      child: Icon(Icons.location_on),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          formattedDate,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                        Text(
                          'Kalyani Nagar Pune,',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          'MH IN',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.search_rounded),
                        const SizedBox(width: 24),
                        Icon(Icons.notifications_none_sharp),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xFFD3D3D3),
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Browse by categories',
              style: TextStyle(
                color: Color(0xFF001833),
                fontSize: 16,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
            SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CategoryTab(
                    text: 'All events',
                    isSelected: selectedCategory == 'All events',
                    onTap: () {
                      setState(() {
                        selectedCategory = 'All events';
                      });
                    },
                  ),
                  SizedBox(width: 16),
                  CategoryTab(
                    text: 'Startup',
                    isSelected: selectedCategory == 'Startup',
                    onTap: () {
                      setState(() {
                        selectedCategory = 'Startup';
                      });
                    },
                  ),
                  SizedBox(width: 16),
                  CategoryTab(
                    text: 'Technology',
                    isSelected: selectedCategory == 'Technology',
                    onTap: () {
                      setState(() {
                        selectedCategory = 'Technology';
                      });
                    },
                  ),
                  SizedBox(width: 16),
                  CategoryTab(
                    text: 'Computer',
                    isSelected: selectedCategory == 'Computer',
                    onTap: () {
                      setState(() {
                        selectedCategory = 'Computer';
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            // Display the selected content based on the category
            selectedContent,
            SizedBox(height: 16),
            FutureBuilder<Data?>(
              future: eventData,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  final event = snapshot.data!; // Use the non-nullable data
                  return ListView(
                    shrinkWrap: true,

                    padding: EdgeInsets.only(top: 50, left: 15, right: 15),
                    children: [
                      // Your existing content...
                      SizedBox(height: 16),
                      EventItem(event: event),
                    ],
                  );
                } else {
                  return Text('No event data available.'); // Handle the case when eventData is null
                }
              },
            ),
            //use eventitem code here
          ],
        ),
      );
    }
  }

  class CategoryTab extends StatelessWidget {
    final String text;
    final bool isSelected;
    final VoidCallback onTap;

    CategoryTab({required this.text, required this.isSelected, required this.onTap});

    @override
    Widget build(BuildContext context) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          width: 108,
          height: 32,
          decoration: ShapeDecoration(
            color: isSelected ? Colors.blue : Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 0.80, color: Color(0xFF8C8C8C)),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: isSelected ? Colors.white : Color(0xFF8C8C8C),
                fontSize: 12,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w400,
                height: 0.15,
              ),
            ),
          ),
        ),
      );
    }
  }


