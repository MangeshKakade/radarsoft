import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:radarsofttask/app/presentation/pages/signIn_screen.dart';
import '../../constants/image_constants.dart';
import '../../data/services/navigation_service.dart';
import '../../utils/loading_indicator.dart';
import '../blocs/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginScreenBloc(),
      child: BlocBuilder<LoginScreenBloc, LoginScreenState>(
        builder: (context, state) {
          return Scaffold(
            body: Container(
              padding: const EdgeInsets.only(left: 16, right: 10, top: 60),
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
                    const SizedBox(height: 68),
                    const Text(
                      'Login to Gathrr',
                      style: TextStyle(
                        color: Color(0xFF001833),
                        fontSize: 32,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w500,
                        height: 0.02,
                      ),
                    ),
                    const SizedBox(height: 48),
                    const Text(
                      'Gathrr is the go-to app to attend events and network with people from your industry.',
                      style: TextStyle(
                        color: Color(0xFF4B4B4B),
                        fontSize: 20,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w400,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 20),
                    LoginFormField(state: state),
                    const SizedBox(height: 40),
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

class LoginFormField extends StatelessWidget {
  final LoginScreenState state;

  LoginFormField({required this.state});

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
        padding: const EdgeInsets.only(left: 16, right: 16, top: 48),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Phone number',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w500,
                height: 0.03,
              ),
            ),
            const SizedBox(height: 28),
            TextFormFieldWidget(state: state),
            const SizedBox(height: 20),
            CheckboxWidget(state: state),
            const SizedBox(height: 48),
            ElevatedButtonWidget(state: state),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account? ",
                  style: TextStyle(
                    color: Color(0xFF4B4B4B),
                    fontSize: 20,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Get.to(SignInScreen());
                  },
                  child: const Text(
                    "Register",
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
            const SizedBox(height: 40),
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
        const Text.rich(
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
            ? CustomLoadingIndicator()
            : const Text(
          'Login',
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



