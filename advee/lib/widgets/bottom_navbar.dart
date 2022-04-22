import 'package:advee/theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget bottomNavigationBar() => Container(
    height: 70,
    decoration: BoxDecoration(boxShadow: [
      BoxShadow(
          color: Colors.black.withOpacity(0.1),
          spreadRadius: 3,
          blurRadius: 6,
          offset: const Offset(0, 0))
    ]),
    child: BottomNavigationBar(
        showUnselectedLabels: true,
        unselectedItemColor: Palette.inactive,
        unselectedFontSize: 9,
        selectedItemColor: Palette.blue,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w700),
        selectedFontSize: 9,
        items: [
          _item(label: 'Home', svgPath: 'assets/images/navbar/home.svg'),
          _item(
              label: 'My Cash', svgPath: 'assets/images/navbar/money_bag.svg'),
          _item(
              label: 'Investment', svgPath: 'assets/images/navbar/invest.svg'),
          _item(label: 'Pay & Bill', svgPath: 'assets/images/navbar/bill.svg'),
          _item(label: 'Learn', svgPath: 'assets/images/navbar/book-open.svg'),
        ]));

BottomNavigationBarItem _item(
        {required String label, required String svgPath}) =>
    BottomNavigationBarItem(
        label: label,
        icon: Padding(
            padding: const EdgeInsets.only(bottom: 7),
            child: SvgPicture.asset(
              svgPath,
              height: 25,
              color: Palette.inactive,
            )),
        activeIcon: Padding(
            padding: const EdgeInsets.only(bottom: 7),
            child: SvgPicture.asset(
              svgPath,
              height: 25,
              color: Palette.blue,
            )));
