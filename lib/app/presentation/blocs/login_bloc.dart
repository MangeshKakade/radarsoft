// import 'package:flutter_bloc/flutter_bloc.dart';
//
// abstract class LoginEvent {}
//
// class PhoneNumberChanged extends LoginEvent {
//   final String phoneNumber;
//
//   PhoneNumberChanged(this.phoneNumber);
// }
//
// class TermsAndConditionsToggled extends LoginEvent {}
//
// abstract class LoginState {}
//
// class LoginInitial extends LoginState {}
//
// class LoginLoading extends LoginState {}
//
// class LoginSuccess extends LoginState {}
//
// class LoginFailure extends LoginState {
//   final String error;
//
//   LoginFailure(this.error);
// }
//
// class LoginBloc extends Bloc<LoginEvent, LoginState> {
//   LoginBloc() : super(LoginInitial());
//
//   @override
//   Stream<LoginState> mapEventToState(LoginEvent event) async* {
//     if (event is PhoneNumberChanged) {
//       yield LoginInitial();
//     } else if (event is TermsAndConditionsToggled) {
//     }
//   }
// }
