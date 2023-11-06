import 'package:flutter_bloc/flutter_bloc.dart';

class SplashBloc extends Cubit<bool> {
  SplashBloc() : super(false);

  void initialize() {
    emit(true);
  }
}
