import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/image_constants.dart';
import '../view_models/login_view_model.dart';
import 'package:http/http.dart' as http;

import 'login_otp_verify_screen.dart'; // Import http package


class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginViewModel viewModel = LoginViewModel();
  bool isCheckboxChecked = false;
  String phoneNumberError = '';

  Future<bool> sendOTP(String phoneNumber) async {
    final url = Uri.parse('https://gathrr.radarsofttech.in:5050/dummy/send-otp');
    final response = await http.post(
      url,
      body: {'phone': phoneNumber},
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      final status = responseData['status'];
      final message = responseData['message'];

      if (status == true) {
        return true; // OTP sent successfully
      }
    }

    return false; // Failed to send OTP
  }

  void navigateToOTPVerifyScreen(String phoneNumber) async {
    final otpSent = await sendOTP(phoneNumber);

    if (otpSent) {
      Get.to(LoginOTPVerifyScreen(phoneNumber: phoneNumber)); // Pass the phone number to OTP verification screen
    } else {
      // Handle OTP sending failure
      print('Failed to send OTP');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 16, right: 10, top: 60),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
            children: [
              Center(
                child: Image.asset(
                  ImageConstants.logoImage,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 68),
              Text(
                'Login to Gathrr',
                style: TextStyle(
                  color: Color(0xFF001833),
                  fontSize: 32,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w500,
                  height: 0.02,
                ),
              ),
              SizedBox(height: 48),
              Text(
                'Gathrr is the go-to app to attend events and network with people from your industry.',
                style: TextStyle(
                  color: Color(0xFF4B4B4B),
                  fontSize: 20,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w400,
                  height: 1.2,
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                    // Add a border with the specified color and width
                    side: BorderSide(
                      width: 1,
                      color: Color(0x3D004999),
                    ),
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.only(left: 16, right: 16, top: 48),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Phone number',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w500,
                          height: 0.03,
                        ),
                      ),
                      SizedBox(height: 28),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'Please enter your phone number',
                          labelStyle: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w400,
                            height: 0.08,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: Color(0x3D004999),
                            ),
                          ),
                          errorText: phoneNumberError,
                        ),
                        onChanged: (value) {
                          if (value.length == 10) {
                            setState(() {
                              phoneNumberError = '';
                            });
                            viewModel.updatePhoneNumber(value);
                          } else {
                            setState(() {
                              phoneNumberError = 'Please enter a 10-digit number';
                            });
                          }
                        },
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Checkbox(
                            value: isCheckboxChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isCheckboxChecked = value!;
                              });
                            },
                            activeColor: Color(0xFF83BAF6), // Change the checkbox color
                          ),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'By proceeding you agree to our ',
                                  style: TextStyle(
                                    color: Color(0xFF4B4B4B),
                                    fontSize: 16,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w400,
                                    height: 1.2,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Terms \n',
                                  style: TextStyle(
                                    color: Color(0xFF004999),
                                    fontSize: 16,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w600,
                                    height: 1.2,
                                  ),
                                ),
                                TextSpan(
                                  text: ' & ',
                                  style: TextStyle(
                                    color: Color(0xFF4B4B4B),
                                    fontSize: 16,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w400,
                                    height: 1.2,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Conditions',
                                  style: TextStyle(
                                    color: Color(0xFF004999),
                                    fontSize: 16,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w600,
                                    height: 1.2,
                                  ),
                                ),
                                TextSpan(
                                  text: ' ',
                                  style: TextStyle(
                                    color: Color(0xFF4B4B4B),
                                    fontSize: 16,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w400,
                                    height: 1.2,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Privacy Policies',
                                  style: TextStyle(
                                    color: Color(0xFF004999),
                                    fontSize: 16,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w600,
                                    height: 1.2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
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
                            if (viewModel.phoneNumber.length == 10) {
                              navigateToOTPVerifyScreen(viewModel.phoneNumber);
                            } else {
                              setState(() {
                                phoneNumberError = 'Please enter a 10-digit number';
                              });
                            }
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an account? ",style: TextStyle(
                            color: Color(0xFF4B4B4B),
                            fontSize: 20,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w400,

                          ),),
                          TextButton(
                            onPressed: () {
                              Get.toNamed('/sign');
                            },
                            child: Text("Register",style: TextStyle(
                              color: Color(0xFF004999),
                              fontSize: 20,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline,

                            ),),
                          ),
                        ],
                      ),
                      SizedBox(height: 40),

                    ],
                  ),
                ),
              ),
              SizedBox(height: 40),

            ],
          ),
        ),
      ),
    );
  }
}
