import 'package:flutter/material.dart';
import '../../constants/image_constants.dart';
import '../../data/repositories/slider_images_data.dart';
import '../../utils/responsive_layout.dart';

class SliderImages extends StatefulWidget {
  const SliderImages({Key? key}) : super(key: key);

  @override
  State<SliderImages> createState() => _SliderImagesState();
}

class _SliderImagesState extends State<SliderImages> {
  List<Map<String, String>> eventData = [];

  @override
  void initState() {
    super.initState();
    fetchEventData();
  }

  Future<void> fetchEventData() async {
    final sliderImageEventData = SliderImageEventData(updateEventData: (data) {
      setState(() {
        eventData = data;
      });
    });

    sliderImageEventData.showEventDetails('your_event_id_here');
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveLayout().init(context);

    double blockSizeHorizontal = ResponsiveLayout.blockSizeHorizontal!;
    double blockSizeVertical = ResponsiveLayout.blockSizeVertical!;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: eventData.map((event) => buildEventCard(event, blockSizeHorizontal, blockSizeVertical)).toList(),
      ),
    );
  }

  Widget buildEventCard(Map<String, String> event, double blockSizeHorizontal, double blockSizeVertical) {
    return Container(
      margin: EdgeInsets.all(blockSizeHorizontal * 5),
      child: Stack(
        children: [
          Container(
            width: blockSizeHorizontal * 76,
            height: blockSizeVertical * 22,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(blockSizeHorizontal * 2.2),
              child: Image.asset(
                ImageConstants.bagImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: blockSizeVertical * 1.2,
            left: blockSizeHorizontal * 2.5,
            child: Text(
              event['organiserMaster'] ?? '',
              style: TextStyle(
                color: Colors.white,
                fontSize: blockSizeHorizontal * 2.8,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Positioned(
            top: blockSizeVertical * 4.2,
            left: blockSizeHorizontal * 2.5,
            child: Text(
              event['eventName'] ?? '',
              style: TextStyle(
                fontSize: blockSizeHorizontal * 3.2,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
          ),
          Positioned(
            top: blockSizeVertical * 8,
            left: blockSizeHorizontal * 2.5,
            child: Text(
              event['startDate'] ?? '',
              style: TextStyle(
                fontSize: blockSizeHorizontal * 2.8,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: blockSizeVertical * 11,
            left: blockSizeHorizontal * 2.5,
            child: Text(
              event['venue'] ?? '',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: blockSizeHorizontal * 2.8,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: blockSizeVertical * 14,
            left: blockSizeHorizontal * 2.5,
            child: Text(
              event['location'] ?? '',
              style: TextStyle(
                fontSize: blockSizeHorizontal * 2.8,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: blockSizeVertical * 20,
            left: blockSizeHorizontal * 2.5,
            child: Text(
              'Terms & Conditions Apply*',
              style: TextStyle(
                color: Color(0xFF8C8C8C),
                fontSize: blockSizeHorizontal * 2,
                fontFamily: 'Helvetica',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Positioned(
            top: blockSizeVertical * 8,
            left: blockSizeHorizontal * 50,
            child: buildScannerImage(),
          ),
        ],
      ),
    );
  }

  Widget buildScannerImage() {
    return Container(
      width: 85,
      height: 85,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(1.88),
        ),
      ),
      child: Image.asset(ImageConstants.scannerImage),
    );
  }
}
