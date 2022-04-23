import 'package:advee/designs/palette.dart';
import 'package:advee/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

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
        scaffoldBackgroundColor: Palettes.background,
      ),
      home: const HomePage(),
    );
  }
}

