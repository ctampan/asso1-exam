import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme/Palette.dart';

Widget cardHeader({required String title, required String detail}) => Row(
  children: [
    Text(
      title,
      style: const TextStyle(
          color: Palette.purpleText,
          fontWeight: FontWeight.w700,
          fontSize: 13),
    ),
    const Spacer(),
    Text(
      detail,
      style: const TextStyle(
          color: Palette.purpleTextDark,
          fontWeight: FontWeight.w700,
          fontSize: 13,
          height: 1.4),
    ),
    const SizedBox(
      width: 5,
    ),
    const Icon(
      Icons.arrow_forward_ios,
      size: 13,
      color: Palette.purpleTextDark,
    ),
    const SizedBox(
      width: 20,
    )
  ],
);