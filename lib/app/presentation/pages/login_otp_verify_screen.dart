import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:http/http.dart' as http;

class LoginOTPVerifyScreen extends StatefulWidget {
  final String phoneNumber;

  LoginOTPVerifyScreen({required this.phoneNumber});

  @override
  State<LoginOTPVerifyScreen> createState() => _LoginOTPVerifyScreenState();
}

class _LoginOTPVerifyScreenState extends State<LoginOTPVerifyScreen> {
  String otp = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 50, left: 15, right: 15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.arrow_back, size: 30),
              ),
              SizedBox(height: 36),
              Text(
                'Check your message box we sent you the 4-digit verification code!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF4B4B4B),
                  fontSize: 20,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 36),

              SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Center(
                  child: PinCodeTextField(
                    keyboardType: TextInputType.phone,
                    appContext: context,
                    length: 4,
                    onChanged: (value) {
                      otp = value;
                    },
                    onCompleted: (value) {
                      otp = value;
                    },
                    backgroundColor: Colors.transparent,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(10),
                      activeColor: Colors.blue,
                      inactiveColor: Colors.grey,
                      selectedColor: Colors.blue,
                      selectedFillColor: Colors.blue,
                    ),
                  ),
                ),
              ),


              SizedBox(height: 48),
              Container(
                width: double.infinity,
                height: 48,
                decoration: ShapeDecoration(
                  color: Color(0xFF004999),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 0.60, color: Color(0xFF004999)),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    // Call the verifyOTP function
                    verifyOTP();
                  },
                  child: Text(
                    'Verify',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 36),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Didn’t receive it?",
                    style: TextStyle(
                      color: Color(0xFF4B4B4B),
                      fontSize: 20,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Handle resend OTP logic here
                    },
                    child: Text(
                      "Tap to resend",
                      style: TextStyle(
                        color: Color(0xFF004999),
                        fontSize: 20,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void verifyOTP() async {
    final url = 'https://gathrr.radarsofttech.in:5050/dummy/verify-otp';
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "phone": widget.phoneNumber,
        "otp": otp,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final bool status = data["status"];
      final String message = data["message"];

      if (status) {
        // OTP verified successfully
        Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.green,
          textColor: Colors.white,
        );
        Get.toNamed('/bottom_bar');
      } else {
        // OTP verification failed
        Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_SHORT, // Use Toast.LENGTH_SHORT
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
      }
    } else {
      // Handle the error
      Fluttertoast.showToast(
        msg: "Failed to verify OTP",
        toastLength: Toast.LENGTH_SHORT, // Use Toast.LENGTH_SHORT
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }
}