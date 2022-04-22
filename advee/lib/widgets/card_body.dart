import 'package:flutter/cupertino.dart';

import 'card_decoration.dart';
import 'card_header.dart';

Widget cardBody(
        {required BuildContext context,
        required double height,
        required String title,
        required String detail,
        required Widget body,
        Widget? icon}) =>
    Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: height,
      decoration: cardDecoration(),
      child: Padding(
        padding: const EdgeInsets.only(top: 30, left: 20),
        child: Column(
          children: [
            cardHeader(title: title, detail: detail, additional: icon),
            const SizedBox(height: 15),
            body
          ],
        ),
      ),
    );
