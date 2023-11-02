import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../constants/image_constants.dart';
import '../blocs/splash_bloc.dart';
import 'login_screen.dart';

class SplashScreen extends StatelessWidget {
  final SplashBloc splashBloc;

  SplashScreen({required this.splashBloc}) {
    splashBloc.initialize();
  }

  @override
  Widget build(BuildContext context) {
    Widget buildLogoSection() {
      return Container(
        padding: EdgeInsets.only(left: 10,right: 10,top: 60),
        child: Column(
          children: [
            Image.asset(
              ImageConstants.logoImage,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 40),
            Text(
              'Gathrr: Where Events \n Come to Life, Effortlessly!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 1.2,
              ),
            ),
            SizedBox(height: 40),

            Image.asset(
              ImageConstants.networkImage,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 40),

          ],
        ),
      );
    }

    return BlocBuilder<SplashBloc, bool>(
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  buildLogoSection(),
                  Container(
                    padding: EdgeInsets.only(left: 10,right: 10),
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed('/login');
                        },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Color(0xFF004999)),
                      ),
                      child: Text(
                        'Get started',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w600,
                          height: 1.2,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
