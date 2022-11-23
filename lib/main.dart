import 'package:flutter/material.dart';

import 'mainpage.dart';

void main() {
  runApp(const MyApp());
}






class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mon App | By Prince',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),

      home: const MainPage(title: 'Ma Liste de Contact'),
    );
  }
}
