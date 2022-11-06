import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pattern_bloc2/bloc/home_bloc.dart';
import 'package:pattern_bloc2/bloc/home_event.dart';
import 'package:pattern_bloc2/pages/home_page.dart';

//https://github.com/masfranzhuo/flutter_crud_with_bloc_library/blob/master/lib/bloc/user_form/user_form_bloc.dart

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
          create: (context) => HomeBloc(),
          child: const HomePage()),
    );
  }
}
