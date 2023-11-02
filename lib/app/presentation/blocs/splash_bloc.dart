import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class SplashBloc extends Cubit<bool> {
  SplashBloc() : super(false);

  void completeSplash() {
    emit(true);
  }

  void initialize() {
    // Perform your initialization logic here.
  }
}

