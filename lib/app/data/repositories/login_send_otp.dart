import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../api/api_config.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ApiService {
  static Future<bool> sendOTP(String phoneNumber) async {
    final url = Uri.parse(ApiConstants.sendOTPUrl);
    final response = await http.post(
      url,
      body: jsonEncode({'phone': phoneNumber}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      final status = responseData['status'];

      if (status == true) {
        Fluttertoast.showToast(
          msg: "OTP sent successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        return true;
      } else {
        final message = responseData['message'];
        print("Failed to send OTP: $message");
      }
    } else {
      print("Failed to send OTP. Status Code: ${response.statusCode}");
    }
    return false;
  }
}
