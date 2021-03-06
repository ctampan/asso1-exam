import 'package:advee/designs/image_path.dart';
import 'package:advee/designs/palette.dart';
import 'package:advee/widgets/card_body.dart';
import 'package:flutter/material.dart';

import '../types/SquareCarousellItem.dart';
import '../widgets/button.dart';

const _topupBillsList = [
  SquareItem(logoPath: ImagePaths.pulsa, name: 'Pulsa'),
  SquareItem(logoPath: ImagePaths.paketData, name: 'Paket Data'),
  SquareItem(logoPath: ImagePaths.listrik, name: 'PLN Prabayar'),
  SquareItem(logoPath: ImagePaths.bpjs, name: 'BPJS'),
  SquareItem(logoPath: ImagePaths.waterDrop, name: 'Air PDAM'),
];

Widget topupBillsSection(BuildContext context) => cardBody(
    context: context,
    height: 265,
    icon: Padding(
        padding: const EdgeInsets.only(right: 5),
        child: Image.asset(
          ImagePaths.bill,
          height: 25,
        )),
    title: 'Top-Up & Bills',
    detail: 'View All',
    body: Column(children: [
      SizedBox(
        height: 110,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            const SizedBox(
              width: 5,
            ),
            for (final item in _topupBillsList)
              Padding(
                padding: const EdgeInsets.only(right: 15, top: 5),
                child:
                    _topupBillsCard(logoPath: item.logoPath, name: item.name),
              )
          ],
        ),
      ),
      const SizedBox(
        height: 15,
      ),
      button(
          height: 40,
          width: 230,
          text: const Text(
            'Create Payment Schedule',
            style: TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w500,
                height: 1.5),
          ))
    ]));

_topupBillsCard({required String logoPath, required String name}) =>
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
                height: 45,
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
                fontSize: 12,
                color: Palettes.purpleText,
                fontWeight: FontWeight.w600,
                height: 1.3),
          ))
    ]);
