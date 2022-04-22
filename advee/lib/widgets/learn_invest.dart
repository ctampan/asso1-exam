import 'package:advee/theme/palette.dart';
import 'package:flutter/material.dart';

Widget learnInvest(BuildContext context) => Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 280,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 6,
                offset: const Offset(6, 7))
          ]),
      child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 20),
          child: Column(
            children: [
              _learnInvestHeader(),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                  height: 200,
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
                  ))
            ],
          )),
    );

Widget _learnInvestHeader() => Row(
      children: const [
        Text(
          'Learn How To Invest',
          style: TextStyle(
              color: Palette.purpleText,
              fontWeight: FontWeight.w700,
              fontSize: 13),
        ),
        Spacer(),
        Text(
          'View All',
          style: TextStyle(
              color: Palette.purpleTextDark,
              fontWeight: FontWeight.w700,
              fontSize: 13,
              height: 1.4),
        ),
        SizedBox(
          width: 5,
        ),
        Icon(
          Icons.arrow_forward_ios,
          size: 13,
          color: Palette.purpleTextDark,
        ),
        SizedBox(
          width: 20,
        )
      ],
    );

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
            fontSize: 11,
              fontWeight: FontWeight.w500, color: Palette.purpleTextDark),
        )
      ],
    );
