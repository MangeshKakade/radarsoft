import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';

import '../presentation/blocs/splash_bloc.dart';
import '../presentation/pages/splash_screen.dart';

class InternetConnectionChecker extends StatelessWidget {
  final SplashBloc splashBloc;

  InternetConnectionChecker({required this.splashBloc});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ConnectivityResult>(
      stream: Connectivity().onConnectivityChanged,
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data == ConnectivityResult.none) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.signal_wifi_off,
                    size: 60,
                    color: Colors.red,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "No Internet Connection",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          );
        } else {
          return SplashScreen(splashBloc: splashBloc);
        }
      },
    );
  }
}
