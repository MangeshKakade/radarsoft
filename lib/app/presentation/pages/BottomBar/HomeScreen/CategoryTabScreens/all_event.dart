import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../data/repositories/event_List_data.dart';
import '../../../../../models/event_list.dart';
import '../../../../view_models/event_item_list._view_model.dart';
import '../../../../widget/slider_images.dart';

class AllEvent extends StatefulWidget {
  const AllEvent({Key? key}) : super(key: key);

  @override
  State<AllEvent> createState() => _AllEventState();
}

class _AllEventState extends State<AllEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SliderImages(),
            Container(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Explore Local Events In Your Area',
                    style: TextStyle(
                      color: Color(0xFF001833),
                      fontSize: 16,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                  TextButton(
                    onPressed: () {

                    },
                    child: Text(
                      'Show more',
                      style: TextStyle(
                        color: Color(0xFF0062CC),
                        fontSize: 14,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.underline,
                        height: 0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            FutureBuilder<List<Data>>(
              future: EventListData.fetchEventData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return _buildLoadingIndicator();
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(
                    child: Text('No events available'),
                  );
                } else {
                  final eventList = snapshot.data;
                  return ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: eventList!.map((event) {
                      return EventItemList(event: event);
                    }).toList(),
                  );
                }
              },
            ),
            Container(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Events this weekend',
                    style: TextStyle(
                      color: Color(0xFF001833),
                      fontSize: 16,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                  TextButton(
                    onPressed: () {

                    },
                    child: Text(
                      'Show more',
                      style: TextStyle(
                        color: Color(0xFF0062CC),
                        fontSize: 14,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.underline,
                        height: 0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadingIndicator() {
    return ListView.builder(
      itemCount: 5,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: ListTile(
            title: Container(
              width: 100.0,
              height: 20.0,
              color: Colors.white,
            ),
            subtitle: Container(
              width: 200.0,
              height: 10.0,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}


