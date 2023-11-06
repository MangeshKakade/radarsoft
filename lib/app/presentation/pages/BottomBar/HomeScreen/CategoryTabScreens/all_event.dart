import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../data/repositories/event_List_data.dart';
import '../../../../../models/event_list.dart';
import '../../../../../utils/responsive_layout.dart';
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
    ResponsiveLayout().init(context);

    double blockSizeHorizontal = ResponsiveLayout.blockSizeHorizontal!;
    double blockSizeVertical = ResponsiveLayout.blockSizeVertical!;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SliderImages(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: blockSizeHorizontal * 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Explore Local Events In Your Area',
                    style: TextStyle(
                      color: Color(0xFF001833),
                      fontSize: blockSizeVertical * 2,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w700,
                      height: 1.2,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Show more',
                      style: TextStyle(
                        color: Color(0xFF0062CC),
                        fontSize: blockSizeVertical * 1.7,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.underline,
                        height: 1.2,
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
                  return _buildLoadingIndicator(blockSizeHorizontal, blockSizeVertical);
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
              padding: EdgeInsets.symmetric(horizontal: blockSizeHorizontal * 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Events this weekend',
                    style: TextStyle(
                      color: Color(0xFF001833),
                      fontSize: blockSizeVertical * 2,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w700,
                      height: 1.2,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Show more',
                      style: TextStyle(
                        color: Color(0xFF0062CC),
                        fontSize: blockSizeVertical * 1.7,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.underline,
                        height: 1.2, // Adjust line height
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

  Widget _buildLoadingIndicator(double blockSizeHorizontal, double blockSizeVertical) {
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
              width: blockSizeHorizontal * 20,
              height: blockSizeVertical * 4,
              color: Colors.white,
            ),
            subtitle: Container(
              width: blockSizeHorizontal * 40,
              height: blockSizeVertical * 2,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
