import 'package:advee/theme/palette.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import '../theme/palette.dart';

AppBar appBar(BuildContext context) => AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 70,
      leading: _buildLeading(),
      title: Center(
        child: Image.asset(
          'assets/images/logo.png',
          width: MediaQuery.of(context).size.width * 0.3,
        ),
      ),
      actions: [_buildAction()],
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
              bottom:
                  Radius.elliptical(MediaQuery.of(context).size.width, 20))),
      elevation: 0.0,
      backgroundColor: Palette.blue,
    );

Widget _buildLeading() => Transform.translate(
    offset: const Offset(10, 0),
    child: Padding(
        padding: const EdgeInsets.all(10),
        child: CircleAvatar(
          backgroundColor: Palette.yellow,
          child: ClipOval(
              child: Image.asset(
            "assets/images/avatar.jpg",
            width: 33,
          )),
        )));

Widget _buildAction() => Transform.translate(
    offset: const Offset(-10, 0),
    child: IconButton(
        onPressed: () {},
        icon: Badge(
            padding: const EdgeInsets.all(6),
            position: BadgePosition.topEnd(end: 4.75),
            badgeContent: const Text(''),
            child: const Icon(
              IconData(0xe451, fontFamily: 'MaterialIcons'),
              size: 30,
            ))));
