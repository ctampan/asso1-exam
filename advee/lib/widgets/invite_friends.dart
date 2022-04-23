import 'package:advee/theme/palette.dart';
import 'package:advee/widgets/button.dart';
import 'package:advee/widgets/stacked_card_body.dart';
import 'package:flutter/material.dart';

Widget inviteFriends(BuildContext context) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Ajak Teman, Dapat Reksa Dana Gratis',
          style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Palette.purpleTextDark),
        ),
        const SizedBox(
          height: 7,
        ),
        stackedCardBody(
            height: 160,
            width: MediaQuery.of(context).size.width * 0.9,
            contents: [
              Positioned(
                  left: 25,
                  top: 25,
                  child: Image.asset(
                    'assets/images/invite_illustration.png',
                    height: 110,
                  )),
              Positioned(
                  top: 35,
                  left: 135,
                  child: Column(
                    children: [
                      const SizedBox(
                        width: 175,
                        child: Text(
                          'Dapatkan hingga Rp. 1jt reksa dana gratis untuk setiap referal',
                          style: TextStyle(
                              color: Colors.white, fontSize: 11, height: 2),
                        ),
                      ),
                      const SizedBox(
                        height: 26,
                      ),
                      button(
                          height: 37,
                          width: 175,
                          text: const Text(
                            'Ajak Sekarang',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                height: 1.5),
                          ))
                    ],
                  ))
            ],
            clippedContents: [
              Positioned(
                  top: -170, left: -275, child: _pill(width: 600, height: 340))
            ])
      ],
    );

Widget _pill({required double width, required double height}) => Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
          color: Palette.pill,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(400))),
    );
