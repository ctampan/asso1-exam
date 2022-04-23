import 'package:advee/designs/image_path.dart';
import 'package:advee/designs/palette.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../types/Bank.dart';

Widget myCashMenu(List<Bank> bankList) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
                padding: const EdgeInsets.only(left: 7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          ImagePaths.creditCard,
                      height: 25,
                    ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'My Cash',
                          style: TextStyle(
                              color: Palettes.purpleText,
                          fontWeight: FontWeight.w600,
                          height: 1.5),
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text(
                          'Detail',
                          style: TextStyle(
                              color: Palettes.purpleText,
                          fontWeight: FontWeight.w500,
                          height: 1.5),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                      color: Palettes.purpleText,
                      size: 15,
                    )
                      ],
                    )
                  ],
                )),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 7, horizontal: 7),
              child: Text(
                'Rp. 15.650.000',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                color: Palettes.purpleTextDark,
                fontSize: 18),
              ),
            ),
            Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 127,
                  height: 22,
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xffe2e2e2)),
                      borderRadius: const BorderRadius.all(Radius.circular(20))),
                  child: const Text(
                    'On 3 Saving Accounts',
                    style: TextStyle(
                        color: Palettes.purpleText,
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    height: 1.5),
                  ),
                ),
                Container(
                  color: const Color(0xffe2e2e2),
                  height: 1.25,
                  width: 178,
                )
              ],
            ),
            const SizedBox(
              height: 7,
            ),
            for (final bank in bankList) _bankBalance(bank)
          ],
        ));

Widget _bankBalance(Bank bank) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 7),
    child: Row(
      children: [
        Container(
          width: 60,
          height: 30,
          decoration: BoxDecoration(
              color: bank.color,
              borderRadius: const BorderRadius.all(Radius.circular(5))),
          child: Padding(
              padding: const EdgeInsets.all(8),
              child: Image.asset(
                bank.logoPath,
              )),
        ),
        const SizedBox(
          width: 7,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              bank.name,
              style: const TextStyle(
                  color: Palettes.purpleTextDark,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              bank.number,
              style: const TextStyle(
                  color: Palettes.purpleText,
                  fontSize: 10,
                  fontWeight: FontWeight.w400),
            )
          ],
        ),
        const Spacer(),
        Text(
          _formatBalance(bank.balance),
          style: const TextStyle(
              color: Palettes.purpleTextDark,
              fontSize: 12,
              fontWeight: FontWeight.w600,
              height: 2.5),
        )
      ],
    ));

String _formatBalance(int balance) {
  var formatter =
  NumberFormat.currency(locale: "id_ID", symbol: "Rp. ", decimalDigits: 0);

  return formatter.format(balance);
}
