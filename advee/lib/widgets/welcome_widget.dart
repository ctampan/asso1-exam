import 'package:flutter/material.dart';

import '../theme/Palette.dart';
import 'button.dart';

Widget welcomeWidget(BuildContext context) => Stack(
  children: [
    ClipPath(
      child: Container(
        width: MediaQuery.of(context).size.width,
            height: 300,
            color: Palette.blue,
          ),
      clipper: WelcomeContainerClipper(),
    ),
    Padding(
        padding: const EdgeInsets.only(top: 115),
            child: Center(
              child: Column(
                children: [
                  const Text(
                    'Hi, Agus Suseno',
                    style: TextStyle(
                        fontFamily: 'Proxima Nova',
                        color: Colors.white,
                        fontSize: 30),
                  ),
                  const SizedBox(
                height: 15,
              ),
              const Text(
                    'Moderate Investor',
                    style: TextStyle(
                        fontFamily: 'Proxima Nova',
                        color: Palette.yellowText,
                        fontWeight: FontWeight.w700,
                        fontSize: 20),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  button(
                      height: 40,
                      width: 175,
                      text: const Text(
                        'Financial Check-Up',
                        style: TextStyle(
                            fontFamily: 'Proxima Nova',
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      )),
                ],
              ),
            )),
      ],
    );

class WelcomeContainerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 40);
    path.quadraticBezierTo(
        size.width / 2, size.height - 15, size.width, size.height - 40);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}