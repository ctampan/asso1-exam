import 'package:flutter/material.dart';

import '../theme/Palette.dart';

Widget button({required double height, required double width, required Text text}) => Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
      gradient: const LinearGradient(
          colors: [Palette.yellowDark, Palette.yellow]),
      borderRadius: BorderRadius.circular(50),
    ),
    child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50)),
        ),
        child: text));