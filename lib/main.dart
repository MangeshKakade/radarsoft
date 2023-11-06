import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'app/presentation/blocs/login_bloc.dart';
import 'app/presentation/blocs/splash_bloc.dart';
import 'app/utils/internet_connection_checker.dart';

void main() {
  final splashBloc = SplashBloc();
  runApp(MyApp(splashBloc: splashBloc));
}

class MyApp extends StatelessWidget {
  final SplashBloc splashBloc;

  const MyApp({Key? key, required this.splashBloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => LoginScreenBloc()),
          BlocProvider(create: (context) => SplashBloc()),
        ],
        child: InternetConnectionChecker(splashBloc: splashBloc),
      ),
    );
  }
}


