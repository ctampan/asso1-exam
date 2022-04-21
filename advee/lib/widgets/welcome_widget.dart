import 'package:advee/widgets/welcome_container_clipper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme/Palette.dart';

Widget welcomeWidget(BuildContext context) => Stack(
  children: [
    ClipPath(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 320,
        color: Palette.blue,
      ),
      clipper: WelcomeContainerClipper(),
    ),
    Padding(
        padding: const EdgeInsets.only(top: 120),
        child: Center(
          child: Column(
            children: [
              const Text(
                'Hi, Agus Suseno',
                style:
                TextStyle(color: Colors.white, fontSize: 30),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Moderate Investor',
                style: TextStyle(
                    color: Palette.yellowText,
                    fontWeight: FontWeight.w700,
                    fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                  height: 40,
                  width: 175,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [
                      Palette.yellowDark,
                      Palette.yellow
                    ]),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(50)),
                      ),
                      child: const Text(
                        'Financial Check-Up',
                        style: TextStyle(
                            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
                      ))),
            ],
          ),
        )),
  ],
);