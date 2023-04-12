import 'package:flutter/material.dart';

import 'pages/available_day.dart';
import 'pages/home_pages.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/' : (context) => const HomePage(),
        'availableDay' :(context) => const AvailableDay(),
      },
    );
  }
}