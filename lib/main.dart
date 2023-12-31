import 'package:flutter/material.dart';
import 'package:flutter_safraapp/views/loginPage.dart';
import 'package:flutter_safraapp/views/startScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: startScreen(),
    );
  }
}
