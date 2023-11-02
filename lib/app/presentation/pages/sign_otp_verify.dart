import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class SignInOtpVerify extends StatefulWidget {
  const SignInOtpVerify({Key? key}) : super(key: key);

  @override
  State<SignInOtpVerify> createState() => _SignInOtpVerifyState();
}

class _SignInOtpVerifyState extends State<SignInOtpVerify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 50,left: 15,right: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back,size: 30),
            ),
            SizedBox(height: 36,),
            Text(
              'Check your message box we sent you    the 4 digit verification code!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF4B4B4B),
                fontSize: 20,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w400,

              ),
            ),
            SizedBox(height: 36,),
            Container(
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),

                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: OTPTextField(
                  obscureText: true,
                  length: 4,
                  width: MediaQuery.of(context).size.width,
                  fieldWidth: 40,
                  style: TextStyle(
                      fontSize: 17
                  ),
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldStyle: FieldStyle.box,
                  onCompleted: (pin) {
                    print("Completed: " + pin);
                  },
                ),
              ),
            ),
            SizedBox(height: 48,),
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
                  //Get.toNamed('/login_otp_verify');
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
            SizedBox(height: 36,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Didn’t receive it?",style: TextStyle(
                  color: Color(0xFF4B4B4B),
                  fontSize: 20,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w400,

                ),),
                TextButton(
                  onPressed: () {

                  },
                  child: Text("Tap to resend",style: TextStyle(
                    color: Color(0xFF004999),
                    fontSize: 20,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline,

                  ),),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
