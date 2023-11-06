import 'package:get/get.dart';
import '../../presentation/pages/otp_verify_screen.dart';
import '../repositories/login_send_otp.dart';


class NavigationService {

  static void navigateToLoginOTPVerifyScreen(String phoneNumber) async {
    final otpSent = await ApiService.sendOTP(phoneNumber);

    if (otpSent) {
      Get.to(OTPVerifyScreen(phoneNumber: phoneNumber));
    } else {
      print('Failed to send OTP');
    }
  }

}
