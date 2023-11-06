import 'package:flutter/foundation.dart';

import '../../data/repositories/login_otp_verification_.dart';
import '../../data/repositories/login_send_otp.dart';

class OTPVerificationViewModel extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> verifyOTP(String phoneNumber, String otp) async {
    try {
      _isLoading = true;
      await OTPVerification.verifyOTP(phoneNumber, otp);
    } catch (e) {
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> resendOTP(String phoneNumber) async {
    try {
      _isLoading = true;
      bool otpSent = await ApiService.sendOTP(phoneNumber);
      if (otpSent) {
      } else {
        print('Failed to send OTP');
      }
    } catch (e) {
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
