import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../constants/image_constants.dart';
import '../blocs/splash_bloc.dart';
import 'login_screen.dart';

class SplashScreen extends StatelessWidget {
  final SplashBloc splashBloc;

  SplashScreen({super.key, required this.splashBloc}) {
  }

  @override
  Widget build(BuildContext context) {
    Widget buildLogoSection() {
      return Container(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 60),
        child: Column(
          children: [
            Image.asset(
              ImageConstants.logoImage,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 40),
            const Text(
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
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Image.asset(
                ImageConstants.networkImage,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 40),
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
                padding: const EdgeInsets.all(16),
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(const LoginScreen());
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(const Color(0xFF004999)),
                  ),
                  child: const Text(
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
        );
      },
    );
  }
}
