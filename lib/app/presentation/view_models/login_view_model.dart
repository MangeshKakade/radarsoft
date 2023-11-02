import 'package:flutter/foundation.dart';

class LoginViewModel extends ChangeNotifier {
  String phoneNumber = '';
  bool isTermsAndConditionsAccepted = false;
  bool isOtpScreen = false;

  void updatePhoneNumber(String newPhoneNumber) {
    phoneNumber = newPhoneNumber;
    notifyListeners();
  }

  void toggleTermsAndConditions() {
    isTermsAndConditionsAccepted = !isTermsAndConditionsAccepted;
    notifyListeners();
  }

  void toggleOtpScreen() {
    isOtpScreen = !isOtpScreen;
    notifyListeners();
  }
}
