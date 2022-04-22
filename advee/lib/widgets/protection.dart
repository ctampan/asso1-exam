import 'package:advee/theme/palette.dart';
import 'package:advee/widgets/card_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../types/SquareCarousellItem.dart';

const _protectionList = [
  SquareItem(
      logoPath: 'assets/images/manulife.png', name: 'Asuransi Jiwa Manulife'),
  SquareItem(
      logoPath: 'assets/images/prudential.png',
      name: 'Jaminan Penyakit Kritis Prudential'),
  SquareItem(
      logoPath: 'assets/images/allianz.png', name: 'Dana Pensiun Allianz'),
  SquareItem(
      logoPath: 'assets/images/car.png', name: 'Asuransi Mobil Auto 2000'),
];

Widget protection(BuildContext context) => cardBody(
    context: context,
    height: 185,
    icon: Padding(
        padding: const EdgeInsets.only(right: 5),
        child: Image.asset(
          'assets/images/protection.png',
          height: 25,
        )),
    title: 'Protection',
    detail: 'Detail',
    body: SizedBox(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          const SizedBox(
            width: 5,
          ),
          Padding(
              padding: const EdgeInsets.only(right: 15, top: 5),
              child: Column(children: [
                Container(
                    height: 65,
                    width: 65,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          colors: [Palette.yellowDark, Palette.yellow]),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                        child: Image.asset(
                          'assets/images/plus.png',
                          height: 25,
                        ))),
                const SizedBox(
                  height: 7,
                ),
                const Text(
                  'Add',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: Palette.purpleTextDark),
                )
              ])),
          for (final protection in _protectionList)
            Padding(
              padding: const EdgeInsets.only(right: 15, top: 5),
              child: _protectionCard(
                  logoPath: protection.logoPath, name: protection.name),
            )
        ],
      ),
    ));

Widget _protectionCard({required String logoPath, required String name}) =>
    Column(children: [
      Container(
          height: 65,
          width: 65,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: const Offset(0, 0))
              ]),
          child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(0),
                primary: Colors.white,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
              ),
              child: Image.asset(
                logoPath,
                height: 35,
              ))),
      const SizedBox(
        height: 7,
      ),
      SizedBox(
          width: 65,
          child: Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 7,
                color: Palette.purpleText,
                fontWeight: FontWeight.w600,
                height: 1.3),
          ))
    ]);
