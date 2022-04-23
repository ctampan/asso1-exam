import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme/Palette.dart';

Widget stackedCardBody(
        {required double height,
        required double width,
        required List<Widget> contents,
        required List<Widget> clippedContents, Color? color}) =>
    Stack(
      alignment: Alignment.topCenter,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            width: width,
            height: height,
            color: color ?? Palette.blue,
            child: Stack(
              children: clippedContents,
            ),
          ),
        ),
        ...contents
      ],
    );
