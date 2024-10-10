import 'package:flutter/material.dart';
import 'package:tugas/app/modules/home/views/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API Demo',
      home: WelcomeScreen(),
    );
  }
}