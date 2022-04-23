import 'package:advee/designs/palette.dart';
import 'package:flutter/material.dart';

Widget cardBody(
        {required BuildContext context,
        required double height,
        required String title,
        required String detail,
        required Widget body,
        Widget? icon}) =>
    Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: height,
      decoration: _cardDecoration(),
      child: Padding(
        padding: const EdgeInsets.only(top: 30, left: 20),
        child: Column(
          children: [
            _cardHeader(title: title, detail: detail, additional: icon),
            const SizedBox(height: 15),
            body
          ],
        ),
      ),
    );

Widget _cardHeader(
        {required String title, required String detail, Widget? additional}) =>
    Row(
      children: [
        if (additional != null) additional,
        Text(
          title,
          style: const TextStyle(
              color: Palettes.purpleText,
              fontWeight: FontWeight.w700,
              fontSize: 13),
        ),
        const Spacer(),
        Text(
          detail,
          style: const TextStyle(
              color: Palettes.purpleTextDark,
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
          color: Palettes.purpleTextDark,
        ),
        const SizedBox(
          width: 20,
        )
      ],
    );

BoxDecoration _cardDecoration() => BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 6,
              offset: const Offset(6, 7))
        ]);