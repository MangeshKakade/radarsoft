import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:connectivity/connectivity.dart';
import 'app/presentation/blocs/login_bloc.dart';
import 'app/presentation/blocs/splash_bloc.dart';
import 'app/presentation/pages/splash_screen.dart';

void main() {
  final splashBloc = SplashBloc();
  runApp(MyApp(splashBloc: splashBloc));
}

class MyApp extends StatelessWidget {
  final SplashBloc splashBloc;

  const MyApp({Key? key, required this.splashBloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => LoginScreenBloc()),
          BlocProvider(create: (context) => SplashBloc()),
        ],
        child: InternetConnectionChecker(splashBloc: splashBloc),
      ),
    );
  }
}

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
// Container(
// decoration: const BoxDecoration(
// color: Color(0x33E0DBDB),
// borderRadius: BorderRadius.only(
// topLeft: Radius.circular(16),
// topRight: Radius.circular(16),
// ),
// border: Border(
// left: BorderSide(color: Color(0xFFCBCBCB)),
// top: BorderSide(color: Color(0xFFCBCBCB)),
// right: BorderSide(color: Color(0xFFCBCBCB)),
// bottom: BorderSide(width: 0.40, color: Color(0xFFCBCBCB)),
// ),
// ),
// child: Padding(
// padding: const EdgeInsets.all(16),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Column(
// mainAxisAlignment: MainAxisAlignment.start,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(
// '${widget.eventData['generalInfo']}',
// textAlign: TextAlign.center,
// style: const TextStyle(
// color: Colors.black,
// fontSize: 20,
// fontFamily: 'Lato',
// fontWeight: FontWeight.w600,
// height: 0,
// ),
// ),
// const SizedBox(height: 8),
// const Text(
// '(No taxes needed)',
// style: TextStyle(
// color: Colors.black,
// fontSize: 14,
// fontFamily: 'Lato',
// fontWeight: FontWeight.w400,
// height: 0,
// ),
// ),
// ],
// ),
// ElevatedButton(
// style: ElevatedButton.styleFrom(
// backgroundColor: const Color(0xFF004999),
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(10),
// ),
// ),
// onPressed: () {
//
// },
// child: const Text(
// 'Register now',
// style: TextStyle(
// color: Colors.white,
// fontSize: 16,
// fontFamily: 'Lato',
// fontWeight: FontWeight.w700,
// height: 0,
// ),
// ),
// ),
// ],
// ),
// ),
// ),