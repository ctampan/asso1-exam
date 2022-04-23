import 'package:advee/designs/image_path.dart';
import 'package:advee/designs/palette.dart';
import 'package:advee/widgets/stacked_card_body.dart';
import 'package:flutter/material.dart';

Widget quotesSection(BuildContext context) => Container(
      height: 510,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 40,
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Quotes of The Day',
                    style: TextStyle(
                        color: Palettes.purpleTextDark,
                        fontSize: 17,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    child: Text(
                      '"Our goal is to make finance the servant, not the master, of the real economy."',
                      style: TextStyle(
                          color: Palettes.purpleText,
                          fontSize: 13,
                          height: 1.5),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    '- Alistair Darling',
                    style: TextStyle(
                        color: Palettes.purpleTextDark,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              )),
          const SizedBox(
            height: 40,
          ),
          _articleCard(
              width: MediaQuery.of(context).size.width * 0.9,
              title: '5 Alasan mengapa Financial Check Up itu Penting',
              author: 'Safir Senduk',
              timePosted: '5 days ago',
              imagePath: ImagePaths.countingMoney),
          const SizedBox(
            height: 15,
          ),
          _articleCard(
              width: MediaQuery.of(context).size.width * 0.9,
              title: '9 Tujuan Finansial Sebelum Mencapai Usia 30',
              author: 'Roni Haslim',
              timePosted: '5 days ago',
              imagePath: ImagePaths.saving),
        ],
      ),
    );

Widget _articleCard(
        {required double width,
        required String title,
        required String author,
        required String timePosted,
        required String imagePath}) =>
    stackedCardBody(height: width * 0.38, width: width, contents: [
      Positioned(
          top: 25,
          left: 155,
          child: SizedBox(
              width: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  RichText(
                      text: TextSpan(
                          style: const TextStyle(
                              fontFamily: 'Avant Garde', fontSize: 13),
                          children: [
                        const TextSpan(text: 'by '),
                        TextSpan(
                            text: author,
                            style: const TextStyle(fontWeight: FontWeight.w700))
                      ]))
                ],
              ))),
      Positioned(
          bottom: 10,
          right: 10,
          child: Text(
            timePosted,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ))
    ], clippedContents: [
      Positioned(
          left: -30,
          child: Image.asset(
            imagePath,
            height: width * 0.38,
          )),
      Positioned(
          right: 0,
          child: Container(
            width: width * 0.6,
            height: width * 0.38,
            color: Palettes.blue,
          )),
    ]);
