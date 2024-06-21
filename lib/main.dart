import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slash_task/core/constants.dart';
import 'package:slash_task/home/repositories/home_repo.dart';
import 'package:slash_task/home/views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Slash',
      theme: ThemeData.light().copyWith(
        textTheme: textTheme,
      ),
      home: RepositoryProvider(
        create: (context) => HomeRepository(),
        child: const ResponsiveHomeScreen(),
      ),
    );
  }
}




