import 'package:advee/screens/home.dart';
import 'package:advee/theme/Palette.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'advee',
      theme: ThemeData(
        fontFamily: 'Avant Garde',
        scaffoldBackgroundColor: Palette.background,
      ),
      home: const HomePage(),
    );
  }
}

