import 'package:flutter/cupertino.dart';

class AgendaTab extends StatelessWidget {
  final Map<String, dynamic> eventData;

  AgendaTab({required this.eventData});

  @override
  Widget build(BuildContext context) {
    // Content for the Agenda tab
    return Center(
      child: Text('Agenda Content'),
    );
  }
}