import 'package:advee/designs/palette.dart';
import 'package:advee/widgets/card_body.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget recentTransactionSection(BuildContext context) => cardBody(
    context: context,
    height: 240,
    icon: const Padding(
        padding: EdgeInsets.only(right: 10),
        child: FaIcon(
          FontAwesomeIcons.clock,
          size: 22,
          color: Palettes.purpleText,
        )),
    title: 'Recent Transaction',
    detail: 'View All',
    body: Padding(
        padding: const EdgeInsets.only(top: 15, right: 25),
        child: Column(
          children: [
            _transaction(
                title: 'PLN Prabayar',
                date: 'Sunday, 15 May 2019',
                amount: '- Rp. 400.000',
                isScheduled: false),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              height: 40,
              thickness: 1,
              color: Palettes.gray,
            ),
            _transaction(
                title: 'Internet Bill',
                date: 'Monday, 14 May 2019',
                amount: '- Rp. 315.000',
                isScheduled: true),
          ],
        )));

Widget _transaction(
        {required String title,
        required String date,
        required String amount,
        required bool isScheduled}) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                  fontSize: 12.5,
                  letterSpacing: 0.25,
                  color: Palettes.purpleTextDark,
                  fontWeight: FontWeight.w600),
            ),
            if (isScheduled)
              const Text(
                'Scheduled Payment',
                style: TextStyle(
                    fontSize: 11,
                    color: Palettes.yellowText,
                    fontWeight: FontWeight.w600),
              )
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              date,
              style: const TextStyle(
                  fontSize: 10,
                  letterSpacing: 0.25,
                  color: Palettes.purpleText,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              amount,
              style: const TextStyle(
                  fontSize: 13,
                  letterSpacing: 0.25,
                  color: Palettes.purpleTextDark,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
      ],
    );
