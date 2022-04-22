import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../theme/Palette.dart';

Widget simulateInvestment(BuildContext context) => Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 111,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Palette.blue),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Simulate Your Investment',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start
                ,
                children: const [
                  FaIcon(
                    FontAwesomeIcons.arrowTrendUp,
                    size: 25,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 230,
                    child: Text(
                      'See how much your money can grow if you start investing today.',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios, color: Colors.white, size: 20,)
                ],
              )
            ],
          )),
    );
