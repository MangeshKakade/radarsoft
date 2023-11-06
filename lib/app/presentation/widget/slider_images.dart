import 'package:flutter/material.dart';
import '../../constants/image_constants.dart';
import '../../data/repositories/slider_images_data.dart';

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
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: eventData.map((event) => buildEventCard(event)).toList(),
      ),
    );
  }

  Widget buildEventCard(Map<String, String> event) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Stack(
        children: [
          Container(
            width: 350,
            height: 200,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                ImageConstants.bagImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: Text(
              event['organiserMaster'] ?? '',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 10,
            child: Text(
              event['eventName'] ?? '',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
          ),
          Positioned(
            top: 80,
            left: 10,
            child: Text(
              event['startDate'] ?? '',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: 110,
            left: 10,
            child: Text(
              event['venue'] ?? '',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: 140,
            left: 10,
            child: Text(
              event['location'] ?? '',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: 180,
            left: 10,
            child: Text(
              'Terms & Conditions Apply*',
              style: TextStyle(
                color: Color(0xFF8C8C8C),
                fontSize: 10,
                fontFamily: 'Helvetica',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Positioned(
            top: 70,
            left: 230,
            child: buildScannerImage(),
          ),
        ],
      ),
    );
  }

  Widget buildScannerImage() {
    return Container(
      width: 105,
      height: 105,
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
