import 'package:advee/theme/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget recommendationWidget(BuildContext context) => Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 135,
                color: Palette.blue,
                child: Stack(
                  children: [
                    Positioned(left: 20, top: 40, child: _circle2(60)),
                    Positioned(left: -45, top: -45, child: _circle1(125)),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Deposit anda di Bank Mandiri akan segera jatuh tempo dalam 6 hari lagi, click untuk melihat rekomendasi alokasi.',
                    style: TextStyle(
                        fontSize: 11,
                        height: 2,
                        color: Colors.white,
                        fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  _buildClickableRecommendation()
                ],
              ),
            ),
            Positioned(
                bottom: 5,
                right: 30,
                child: Image.asset(
                  'assets/images/invest_illustration.png',
                  width: 110,
                )),
          ],
        ),
        const SizedBox(
          height: 7,
        ),
        SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _circle3(7, Palette.blue),
                const SizedBox(
                  width: 5,
                ),
                _circle3(7, const Color(0xffc4c4c4))
              ],
            )),
      ]),
    );

Widget _circle1(double size) => Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          color: Palette.circle1,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 7,
                offset: const Offset(2, 2))
          ]),
    );

Widget _circle2(double size) => Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          color: Palette.circle2,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 7,
                offset: const Offset(2, 2))
          ]),
    );

Widget _circle3(double size, Color color) => Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );

Widget _buildClickableRecommendation() => Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        child: SizedBox(
          width: 160,
          child: Row(
            children: const [
              Text(
                'Lihat Rekomendasi',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                width: 5,
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 15,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
