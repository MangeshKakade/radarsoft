import 'package:flutter/cupertino.dart';

class SpeakersTab extends StatelessWidget {
  final Map<String, dynamic> eventData;

  SpeakersTab({required this.eventData});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Speakers Content'),
    );
  }
}