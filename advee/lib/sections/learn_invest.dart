import 'package:advee/designs/image_path.dart';
import 'package:advee/designs/palette.dart';
import 'package:advee/widgets/card_body.dart';
import 'package:flutter/material.dart';

Widget learnInvestSection(BuildContext context) => cardBody(
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
                          ImagePaths.coinPlant,
                          colorBlendMode: BlendMode.multiply,
                          color: Palettes.blue,
                          height: 145,
                        )),
                    color: Palettes.blue,
                    text1: 'Investment',
                    text2: '101')),
            Padding(
                padding: const EdgeInsets.only(right: 15),
                child: _learnCard(
                    image: Positioned(
                        bottom: 10,
                        right: -35,
                        child: Image.asset(
                          ImagePaths.money,
                          colorBlendMode: BlendMode.multiply,
                          color: Palettes.yellowDark,
                          height: 70,
                        )),
                    color: Palettes.yellowDark,
                    text1: 'How to',
                    text2: 'buy & sell')),
            Padding(
                padding: const EdgeInsets.only(right: 15),
                child: _learnCard(
                    image: Positioned(
                        bottom: 0,
                        right: -40,
                        child: Image.asset(
                          ImagePaths.shield,
                          colorBlendMode: BlendMode.multiply,
                          color: Palettes.orange,
                          height: 100,
                        )),
                    color: Palettes.orange,
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
              color: Palettes.purpleTextDark),
        )
      ],
    );
