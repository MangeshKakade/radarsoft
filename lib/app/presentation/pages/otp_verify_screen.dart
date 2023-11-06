import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:radarsofttask/app/presentation/pages/login_screen.dart';

import '../../utils/loading_indicator.dart';
import '../../utils/responsive_layout.dart';
import '../view_models/login_otp_view_model.dart';

class OTPVerifyScreen extends StatefulWidget {
  final String phoneNumber;

  const OTPVerifyScreen({super.key, required this.phoneNumber});

  @override
  State<OTPVerifyScreen> createState() => _OTPVerifyScreenState();
}

class _OTPVerifyScreenState extends State<OTPVerifyScreen> {
  String otp = "";
  bool isVerifying = false;

  @override
  Widget build(BuildContext context) {
    ResponsiveLayout().init(context);

    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => OTPVerificationViewModel(),
        child: Consumer<OTPVerificationViewModel>(
          builder: (context, viewModel, child) {
            return Container(
              padding: EdgeInsets.only(
                top: ResponsiveLayout.blockSizeVertical! * 5,
                left: ResponsiveLayout.blockSizeHorizontal! * 5,
                right: ResponsiveLayout.blockSizeHorizontal! * 5,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.to(LoginScreen());
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        size: ResponsiveLayout.blockSizeHorizontal! * 7,
                      ),
                    ),
                    SizedBox(height: ResponsiveLayout.blockSizeVertical! * 4),
                    Text(
                      'Check your message box we sent you the 4-digit verification code!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF4B4B4B),
                        fontSize: ResponsiveLayout.blockSizeVertical! * 2.5,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: ResponsiveLayout.blockSizeVertical! * 3),
                    SizedBox(height: ResponsiveLayout.blockSizeVertical! * 2),
                    Container(
                      padding: EdgeInsets.all(ResponsiveLayout.blockSizeHorizontal! * 4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(ResponsiveLayout.blockSizeHorizontal! * 14),
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
                            borderRadius: BorderRadius.circular(ResponsiveLayout.blockSizeHorizontal! * 10), // Adjust border radius
                            activeColor: Colors.blue,
                            inactiveColor: Colors.grey,
                            selectedColor: Colors.blue,
                            selectedFillColor: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: ResponsiveLayout.blockSizeVertical! * 6),
                    SizedBox(
                      width: double.infinity,
                      height: ResponsiveLayout.blockSizeVertical! * 6,
                      child: ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            isVerifying = true;
                          });
                          await viewModel.verifyOTP(widget.phoneNumber, otp);
                          setState(() {
                            isVerifying = false;
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Color(0xFF004999)),
                        ),
                        child: isVerifying
                            ? CustomLoadingIndicator() // Show circular progress indicator when verifying
                            : Text(
                          'Verify',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: ResponsiveLayout.blockSizeVertical! * 2.5,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: ResponsiveLayout.blockSizeVertical! * 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Didn’t receive it?",
                          style: TextStyle(
                            color: Color(0xFF4B4B4B),
                            fontSize: ResponsiveLayout.blockSizeVertical! * 2.5,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            await viewModel.resendOTP(widget.phoneNumber);
                          },
                          child: Text(
                            "Tap to resend",
                            style: TextStyle(
                              color: Color(0xFF004999),
                              fontSize: ResponsiveLayout.blockSizeVertical! * 2.5,
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
            );
          },
        ),
      ),
    );
  }
}