import 'package:alarm_movil/bloc/alarm_bloc.dart';
import 'package:alarm_movil/views/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login/Login.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AlarmBloc(),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            iconTheme: const IconThemeData(color: Color(0xFF33658a)),
            primarySwatch: colorCustom,
            appBarTheme: const AppBarTheme(
                backgroundColor: Colors.transparent,
                elevation: 0,
                titleTextStyle: TextStyle(color: Color(0xFF33658a))),
            scaffoldBackgroundColor: const Color(0xffF5F8FF),
          ),
          home: Login(),
        ));
  }
}
