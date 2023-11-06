import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:radarsofttask/app/presentation/pages/login_screen.dart';


import '../../utils/loading_indicator.dart';
import '../view_models/login_otp_view_model.dart';

class OTPVerifyScreen extends StatefulWidget {
  final String phoneNumber;

  const OTPVerifyScreen({super.key, required this.phoneNumber});

  @override
  State<OTPVerifyScreen> createState() => _OTPVerifyScreenState();
}

class _OTPVerifyScreenState extends State<OTPVerifyScreen> {
  String otp = "";
  bool isVerifying = false; // Add this line

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => OTPVerificationViewModel(),
        child: Consumer<OTPVerificationViewModel>(
            builder: (context, viewModel, child){
              return Container(
                padding: const EdgeInsets.only(top: 50, left: 15, right: 15),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.to(LoginScreen());
                        },
                        icon: const Icon(Icons.arrow_back, size: 30),
                      ),
                      const SizedBox(height: 36),
                      const Text(
                        'Check your message box we sent you the 4-digit verification code!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF4B4B4B),
                          fontSize: 20,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 36),

                      const SizedBox(height: 24),
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
                      const SizedBox(height: 48),
                      SizedBox(
                        width: double.infinity,
                        height: 44,
                        child: ElevatedButton(
                          onPressed: () async {
                            setState(() {
                              isVerifying = true; // Set isVerifying to true when verification starts
                            });
                            await viewModel.verifyOTP(widget.phoneNumber, otp);
                            setState(() {
                              isVerifying = false; // Set isVerifying to false when verification finishes
                            });
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(const Color(0xFF004999)),
                          ),
                          child: isVerifying
                              ? CustomLoadingIndicator() // Show circular progress indicator when verifying
                              : const Text(
                            'Verify',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )

                      ),
                      const SizedBox(height: 36),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Didn’t receive it?",
                            style: TextStyle(
                              color: Color(0xFF4B4B4B),
                              fontSize: 20,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextButton(
                            onPressed: () async {
                              await viewModel.resendOTP(widget.phoneNumber);
                            },
                            child: const Text(
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
              );
            }

        ),
      ),
    );
  }
}
