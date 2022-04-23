import 'package:advee/designs/image_path.dart';
import 'package:advee/designs/palette.dart';
import 'package:advee/widgets/card_body.dart';
import 'package:flutter/material.dart';

Widget investmentForYouSection(BuildContext context) => cardBody(
    context: context,
    height: 220,
    title: 'Investment For You',
    detail: 'View All',
    body: SizedBox(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: _forYouCard(
                text: 'Ciptadana Cash',
                image: Positioned(
                    bottom: -5,
                    right: -25,
                    child: Image.asset(
                      ImagePaths.ciptadanaCash,
                      height: 110,
                    )),
                sub1: '18% p.a.',
                sub2: 'Equity Fund'),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: _forYouCard(
                text: 'CIMB Niaga',
                image: Positioned(
                    bottom: -5,
                    right: -15,
                    child: Image.asset(
                      ImagePaths.cimbNiaga,
                      height: 110,
                    )),
                sub1: '6.5% p.a.',
                sub2: 'Term Deposit'),
          )
        ],
      ),
    ));

Widget _forYouCard({
  required Widget image,
  required String text,
  required String sub1,
  required String sub2,
}) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            width: 190,
            height: 120,
            color: Palettes.teal,
            child: Stack(
              children: [
                image,
                Positioned(
                    top: 15,
                    left: 15,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: 120,
                            child: Text(
                              text,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18),
                            )),
                      ],
                    )),
                Positioned(
                    left: 15,
                    bottom: 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          sub1,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 12),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          sub2,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 11),
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 7,
        ),
        Text(
          text,
          style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Palettes.purpleTextDark),
        )
      ],
    );
