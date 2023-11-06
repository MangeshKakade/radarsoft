import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../constants/image_constants.dart';
import '../../data/services/navigation_service.dart';
import '../../utils/responsive_layout.dart';
import '../blocs/login_bloc.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginScreenBloc(),
      child: BlocBuilder<LoginScreenBloc, LoginScreenState>(
        builder: (context, state) {
          return Scaffold(
            body: Container(
              padding: EdgeInsets.fromLTRB(
                ResponsiveLayout.blockSizeHorizontal! * 5,
                ResponsiveLayout.blockSizeHorizontal! * 16,
                ResponsiveLayout.blockSizeHorizontal! * 5,
                ResponsiveLayout.blockSizeHorizontal! * 6,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.asset(
                        ImageConstants.logoImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: ResponsiveLayout.blockSizeVertical! * 5),
                    Text(
                      'Join Gathrr',
                      style: TextStyle(
                        color: Color(0xFF001833),
                        fontSize: ResponsiveLayout.blockSizeHorizontal! * 6,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w500,
                        height: 1.2,
                      ),
                    ),
                    SizedBox(height: ResponsiveLayout.blockSizeVertical! * 4),
                    Text(
                      'Join Gathrr to attend events network with the people from your industry.',
                      style: TextStyle(
                        color: Color(0xFF4B4B4B),
                        fontSize: ResponsiveLayout.blockSizeHorizontal! * 4,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w400,
                        height: 1.2,
                      ),
                    ),
                    SizedBox(height: ResponsiveLayout.blockSizeVertical! * 2),
                    SignFormField(state: state),
                    SizedBox(height: ResponsiveLayout.blockSizeVertical! * 4),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class SignFormField extends StatelessWidget {
  final LoginScreenState state;

  SignFormField({required this.state});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
          side: BorderSide(
            width: 1,
            color: Color(0x3D004999),
          ),
        ),
      ),
      child: Container(
        padding: EdgeInsets.fromLTRB(
          ResponsiveLayout.blockSizeHorizontal! * 2,
          ResponsiveLayout.blockSizeHorizontal! * 2,
          ResponsiveLayout.blockSizeHorizontal! * 2,
          ResponsiveLayout.blockSizeVertical! * 6,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Phone number',
              style: TextStyle(
                color: Colors.black,
                fontSize: ResponsiveLayout.blockSizeHorizontal! * 5,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w500,
                height: ResponsiveLayout.blockSizeVertical! * 0.3,
              ),
            ),
            SizedBox(height: ResponsiveLayout.blockSizeVertical! * 3),
            TextFormFieldWidget(state: state),
            SizedBox(height: ResponsiveLayout.blockSizeVertical! * 2),
            CheckboxWidget(state: state),
            SizedBox(height: ResponsiveLayout.blockSizeVertical! * 4),
            ElevatedButtonWidget(state: state),
            SizedBox(height: ResponsiveLayout.blockSizeVertical! * 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ",
                  style: TextStyle(
                    color: Color(0xFF4B4B4B),
                    fontSize: ResponsiveLayout.blockSizeHorizontal! * 4,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Get.to(SignInScreen());
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Color(0xFF004999),
                      fontSize: ResponsiveLayout.blockSizeHorizontal! * 4,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: ResponsiveLayout.blockSizeVertical! * 4),
          ],
        ),
      ),
    );
  }
}

class TextFormFieldWidget extends StatelessWidget {
  final LoginScreenState state;

  TextFormFieldWidget({required this.state});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: 'Please enter your phone number',
        labelStyle: const TextStyle(
          fontSize: 16,
          fontFamily: 'Lato',
          fontWeight: FontWeight.w400,
          height: 0.08,
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Color(0x3D004999),
          ),
        ),
        errorText: state.phoneNumberError,
      ),
      onChanged: (value) {
        if (value.length == 10) {
          context.read<LoginScreenBloc>().add(PhoneNumberErrorChanged(''));
        } else {
          context.read<LoginScreenBloc>().add(PhoneNumberErrorChanged('Please enter a 10-digit number'));
        }

        context.read<LoginScreenBloc>().add(PhoneNumberChanged(value));
      },
    );
  }
}

class CheckboxWidget extends StatelessWidget {
  final LoginScreenState state;

  CheckboxWidget({required this.state});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: state.isTermsAndConditionsAccepted,
          onChanged: (bool? value) {
            context.read<LoginScreenBloc>().add(ToggleTermsAndConditions());
          },
          activeColor: const Color(0xFF83BAF6),
          focusColor: const Color(0xFF83BAF6),
          hoverColor: const Color(0xFF83BAF6),
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'By proceeding you agree to our ',
                style: TextStyle(
                  color: Color(0xFF4B4B4B),
                  fontSize: ResponsiveLayout.blockSizeHorizontal! * 4,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w400,
                  height: ResponsiveLayout.blockSizeVertical! * 0.12,
                ),
              ),
              TextSpan(
                text: 'Terms \n',
                style: TextStyle(
                  color: Color(0xFF004999),
                  fontSize: ResponsiveLayout.blockSizeHorizontal! * 4,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w600,
                  height: ResponsiveLayout.blockSizeVertical! * 0.12,
                ),
              ),
              TextSpan(
                text: ' & ',
                style: TextStyle(
                  color: Color(0xFF4B4B4B),
                  fontSize: ResponsiveLayout.blockSizeHorizontal! * 4,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w400,
                  height: ResponsiveLayout.blockSizeVertical! * 0.12,
                ),
              ),
              TextSpan(
                text: 'Conditions',
                style: TextStyle(
                  color: Color(0xFF004999),
                  fontSize: ResponsiveLayout.blockSizeHorizontal! * 4,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w600,
                  height: ResponsiveLayout.blockSizeVertical! * 0.12,
                ),
              ),
              TextSpan(
                text: ' ',
                style: TextStyle(
                  color: Color(0xFF4B4B4B),
                  fontSize: ResponsiveLayout.blockSizeHorizontal! * 4,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w400,
                  height: 1.2,                ),
              ),
              TextSpan(
                text: 'Privacy Policies',
                style: TextStyle(
                  color: Color(0xFF004999),
                  fontSize: ResponsiveLayout.blockSizeHorizontal! * 4,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w600,
                  height: 1.2,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ElevatedButtonWidget extends StatelessWidget {
  final LoginScreenState state;

  ElevatedButtonWidget({required this.state});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (state.phoneNumber.length == 10) {
          context.read<LoginScreenBloc>().add(LoadingStarted());
          NavigationService.navigateToLoginOTPVerifyScreen(state.phoneNumber);
        } else {
          context.read<LoginScreenBloc>().add(PhoneNumberErrorChanged('Please enter a 10-digit number'));
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF004999),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 0.60, color: Color(0xFF004999)),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      child: Container(
        width: double.infinity,
        height: 48,
        alignment: Alignment.center,
        child: state.isLoading
            ? CircularProgressIndicator()
            : const Text(
          'Join Gathrr',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'Lato',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}




