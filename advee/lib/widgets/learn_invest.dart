import 'package:advee/theme/palette.dart';
import 'package:advee/widgets/card_body.dart';
import 'package:flutter/material.dart';

Widget learnInvest(BuildContext context) => cardBody(
    context: context,
    height: 285,
    title: 'Learn How To Invest',
    detail: 'View All',
    body: SizedBox(
        height: 205,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Padding(
                padding: const EdgeInsets.only(right: 15),
                child: _learnCard(
                    image: Positioned(
                        bottom: 0,
                        right: -90,
                        child: Image.asset(
                          'assets/images/coin_plant_original.jpg',
                          colorBlendMode: BlendMode.multiply,
                          color: Palette.blue,
                          height: 145,
                        )),
                    color: Palette.blue,
                    text1: 'Investment',
                    text2: '101')),
            Padding(
                padding: const EdgeInsets.only(right: 15),
                child: _learnCard(
                    image: Positioned(
                        bottom: 10,
                        right: -35,
                        child: Image.asset(
                          'assets/images/money.png',
                          colorBlendMode: BlendMode.multiply,
                          color: Palette.yellowDark,
                          height: 70,
                        )),
                    color: Palette.yellowDark,
                    text1: 'How to',
                    text2: 'buy & sell')),
            Padding(
                padding: const EdgeInsets.only(right: 15),
                child: _learnCard(
                    image: Positioned(
                        bottom: 0,
                        right: -40,
                        child: Image.asset(
                          'assets/images/shield.png',
                          colorBlendMode: BlendMode.multiply,
                          color: Palette.orange,
                          height: 100,
                        )),
                    color: Palette.orange,
                    text1: 'Protect',
                    text2: 'investment')),
          ],
        )));

Widget _learnCard(
        {required Widget image,
        required String text1,
        required String text2,
        required Color color}) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              width: 125,
              height: 180,
              color: color,
              child: Stack(
                children: [
                  image,
                  Positioned(
                      top: 35,
                      left: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            text1,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 15),
                          ),
                          Text(
                            text2.toUpperCase(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 19,
                            ),
                          )
                        ],
                      ))
                ],
              ),
            )),
        const SizedBox(
          height: 7,
        ),
        Text(
          text1 + ' ' + text2,
          style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Palette.purpleTextDark),
        )
      ],
    );
