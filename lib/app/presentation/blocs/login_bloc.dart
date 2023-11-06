import 'package:bloc/bloc.dart';

class LoginScreenBloc extends Bloc<LoginScreenEvent, LoginScreenState> {
  LoginScreenBloc() : super(LoginScreenState()) {
    on<PhoneNumberChanged>((event, emit) {
      emit(state.copyWith(phoneNumber: event.phoneNumber));
    });

    on<ToggleTermsAndConditions>((event, emit) {
      emit(state.copyWith(isTermsAndConditionsAccepted: !state.isTermsAndConditionsAccepted));
    });

    on<PhoneNumberErrorChanged>((event, emit) {
      emit(state.copyWith(phoneNumberError: event.error));
    });

    on<LoadingStarted>((event, emit) {
      emit(state.copyWith(isLoading: true));
    });
  }

  @override
  Stream<LoginScreenState> mapEventToState(LoginScreenEvent event) async* {
    if (event is PhoneNumberChanged) {
      yield state.copyWith(phoneNumber: event.phoneNumber);
    } else if (event is PhoneNumberErrorChanged) {
      yield state.copyWith(phoneNumberError: event.error);
    } else if (event is ToggleTermsAndConditions) {
      yield state.copyWith(isTermsAndConditionsAccepted: !state.isTermsAndConditionsAccepted);
    } else if (event is LoadingStarted) {
      yield state.copyWith(isLoading: true);
    }
  }
}

class LoginScreenEvent {}

class PhoneNumberChanged extends LoginScreenEvent {
  final String phoneNumber;

  PhoneNumberChanged(this.phoneNumber);
}

class PhoneNumberErrorChanged extends LoginScreenEvent {
  final String error;

  PhoneNumberErrorChanged(this.error);
}

class LoadingStarted extends LoginScreenEvent {}

class ToggleTermsAndConditions extends LoginScreenEvent {}

class LoginScreenState {
  final String phoneNumber;
  final bool isTermsAndConditionsAccepted;
  final String phoneNumberError;
  final bool isLoading;

  LoginScreenState({
    this.phoneNumber = '',
    this.isTermsAndConditionsAccepted = false,
    this.phoneNumberError = '',
    this.isLoading = false,
  });

  LoginScreenState copyWith({String? phoneNumber, bool? isTermsAndConditionsAccepted, String? phoneNumberError, bool? isLoading}) {
    return LoginScreenState(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      isTermsAndConditionsAccepted: isTermsAndConditionsAccepted ?? this.isTermsAndConditionsAccepted,
      phoneNumberError: phoneNumberError ?? this.phoneNumberError,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
