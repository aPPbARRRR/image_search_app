import 'package:flutter/material.dart';
import 'package:search_pics_prac_app/view/screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
     
      home: const HomeScreen(),
    );
  }
}
