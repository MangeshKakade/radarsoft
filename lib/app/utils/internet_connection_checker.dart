import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';

class InternetConnectionChecker extends StatelessWidget {
  final Widget child; // Your regular content
  final Widget noInternetWidget;

  InternetConnectionChecker({required this.child, required this.noInternetWidget});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ConnectivityResult>(
      stream: Connectivity().onConnectivityChanged,
      builder: (context, snapshot) {
        if (snapshot.data == ConnectivityResult.none) {
          return noInternetWidget;
        } else {
          return child;
        }
      },
    );
  }
}
