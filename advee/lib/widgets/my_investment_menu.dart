import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme/Palette.dart';
import 'button.dart';

Widget myInvestmentMenu() => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              Image.asset(
                'assets/images/invest_icon.png',
                height: 20,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'My Investment',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    height: 1.5),
              )
            ]),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  'Detail',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      height: 1.5),
                ),
                SizedBox(
                  width: 7,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 15,
                )
              ],
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Rp. 45.000.000',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/triangle_green.png',
                width: 12,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'Rp. 7.200.000 (YTD)',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    height: 1.5),
              )
            ],
          ),
        ),
        const Text(
          'On 2 Investments',
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.white,
              height: 1.5),
        ),
        const SizedBox(
          height: 15,
        ),
        const Text(
          'Make your money work for you!',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        const Text('Invest and grow asset to gain more profit',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            )),
        const SizedBox(
          height: 24,
        ),
        button(height: 50, width: 125, text: const Text(
          'Invest',
          style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
              height: 1.25),
        )),
      ],
    ));
