// authentication_repository.dart

import 'package:http/http.dart' as http;

class AuthenticationRepository {
  Future<String> sendOtp(String phoneNumber) async {
    final response = await http.post(
      Uri.parse('https://gathrr.radarsofttech.in:5050/dummy/send-otp'),
      body: {'phone': phoneNumber},
    );
    return response.body;
  }

  Future<String> verifyOtp(String phoneNumber, String otp) async {
    final response = await http.post(
      Uri.parse('https://gathrr.radarsofttech.in:5050/dummy/verify-otp'),
      body: {'phone': phoneNumber, 'otp': otp},
    );
    return response.body;
  }
}
