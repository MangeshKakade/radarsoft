import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/image_constants.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isCheckboxChecked = false;

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
                'Join Gathrr',
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
                'Join Gathrr to attend events network with the people from your industry.',
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
                        ),
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
                            Get.toNamed('/sign_otp_verify');
                          },
                          child: Text(
                            'Join Gathrr',
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
                              Get.toNamed('/login');
                            },
                            child: Text("Login",style: TextStyle(
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
