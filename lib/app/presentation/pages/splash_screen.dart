import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../constants/image_constants.dart';
import '../blocs/splash_bloc.dart';
import 'login_screen.dart';
import '../../utils/responsive_layout.dart';

class SplashScreen extends StatelessWidget {
  final SplashBloc splashBloc;

  SplashScreen({super.key, required this.splashBloc});

  @override
  Widget build(BuildContext context) {
    ResponsiveLayout().init(context);

    double blockSizeHorizontal = ResponsiveLayout.blockSizeHorizontal!;
    double blockSizeVertical = ResponsiveLayout.blockSizeVertical!;

    Widget buildLogoSection() {
      return Container(
        padding: EdgeInsets.only(
          left: blockSizeHorizontal * 10,
          right: blockSizeHorizontal * 10,
          top: blockSizeVertical * 6,
        ),
        child: Column(
          children: [
            Image.asset(
              ImageConstants.logoImage,
              fit: BoxFit.cover,
            ),
            SizedBox(height: blockSizeVertical * 4),
            Text(
              'Gathrr: Where Events \n Come to Life, Effortlessly!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: blockSizeHorizontal * 5,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 1.2,
              ),
            ),
            SizedBox(height: blockSizeVertical * 4),
            Image.asset(
              ImageConstants.networkImage,
              fit: BoxFit.cover,
            ),
            SizedBox(height: blockSizeVertical * 4),
          ],
        ),
      );
    }

    return BlocBuilder<SplashBloc, bool>(
      builder: (context, state) {
        return Scaffold(
          body: Column(
            children: <Widget>[
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      buildLogoSection(),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(blockSizeHorizontal * 2),
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(const LoginScreen());
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(const Color(0xFF004999)),
                  ),
                  child: Text(
                    'Get started',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: blockSizeHorizontal * 5,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w600,
                      height: 1.2,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
