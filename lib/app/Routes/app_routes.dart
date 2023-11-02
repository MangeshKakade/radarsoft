import 'package:get/get.dart';
import 'package:radarsofttask/app/presentation/pages/login_screen.dart';
import 'package:radarsofttask/app/presentation/pages/signIn_screen.dart';
import 'package:radarsofttask/app/presentation/pages/sign_otp_verify.dart';
import '../presentation/blocs/splash_bloc.dart';
import '../presentation/pages/BottomBar/bottom_bar.dart';
import '../presentation/pages/login_otp_verify_screen.dart';
import '../presentation/pages/splash_screen.dart';

class AppRoutes {
  static const initial = '/bottom_bar';

  static final routes = [
    GetPage(
      name: '/splash',
      page: () => SplashScreen(splashBloc: Get.find<SplashBloc>()),
    ),
    GetPage(
      name: '/login',
      page: () => LoginScreen(),
    ),
    GetPage(
      name: '/sign',
      page: () => SignInScreen(),
    ),
    GetPage(
      name: '/login_otp_verify', // Define a route for OTP Verification screen
      page: () => LoginOTPVerifyScreen(phoneNumber: '',),
    ),
    GetPage(
      name: '/sign_otp_verify', // Define a route for OTP Verification screen
      page: () => SignInOtpVerify(),
    ),
    GetPage(
      name: '/bottom_bar', // Define a route for OTP Verification screen
      page: () => BottomBar(),
    ),


  ];
}
