import 'package:flutter/cupertino.dart';

class SponsorsTab extends StatelessWidget {
  final Map<String, dynamic> eventData;

  SponsorsTab({required this.eventData});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Sponsors Content'),
    );
  }
}