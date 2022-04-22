import 'package:advee/theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../types/Bank.dart';

class CashInvestment extends StatefulWidget {
  const CashInvestment({Key? key}) : super(key: key);

  static const List<String> _tabList = ['My Cash', 'My Investment'];

  static const List<Bank> _bankList = [
    Bank(
        name: 'Bank Mandiri',
        number: 'XXXX XXXX XXXX 1324',
        balance: 12000000,
        logoPath: 'assets/images/bank_mandiri_white.png',
        color: Palette.mandiri),
    Bank(
        name: 'Bank BCA',
        number: 'XXXX XXXX XXXX 5637',
        balance: 3000000,
        logoPath: 'assets/images/bank_bca_white.png',
        color: Palette.bca),
    Bank(
        name: 'OVO',
        number: 'XXXX XXXX 6363',
        balance: 10000000,
        logoPath: 'assets/images/ovo_white.png',
        color: Palette.ovo),
  ];

  @override
  State<StatefulWidget> createState() => _CashInvestmentState();
}

class _CashInvestmentState extends State<CashInvestment> {
  String _activeTab = CashInvestment._tabList[0];

  _handleChangeTab(String tabName) {
    setState(() {
      _activeTab = tabName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 350,
        child: Stack(
          clipBehavior: Clip.hardEdge,
          children: [
            _menu(context: context, activeTab: _activeTab),
            Row(
              children: [
                for (final tab in CashInvestment._tabList)
                  _tab(
                      context: context,
                      title: tab,
                      isActive: tab == _activeTab,
                      selectTab: _handleChangeTab),
              ],
            ),
          ],
        ));
  }
}

Widget _tab(
        {required BuildContext context,
        required String title,
        required bool isActive,
        required selectTab}) =>
    InkWell(
        onTap: () {
          selectTab(title);
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.45,
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: isActive ? Palette.blue : Palette.gray,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(15))),
          child: Text(
            title,
            style: isActive
                ? const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 15)
                : const TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Palette.purpleTextDark,
                    fontSize: 15),
          ),
        ));

Widget _menu({required BuildContext context, required String activeTab}) =>
    Positioned(
        top: 39,
        width: MediaQuery.of(context).size.width * 0.9,
        height: 251,
        child: Container(
          decoration: BoxDecoration(
              color: activeTab == "My Cash" ? Colors.white : Palette.blue,
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(15)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 6,
                    offset: const Offset(6, 7))
              ]),
          child: activeTab == "My Cash" ? _myCashMenu() : null,
        ));

Widget _myCashMenu() => Padding(
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
                      'assets/images/credit_card.png',
                      height: 25,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'My Cash',
                      style: TextStyle(
                          color: Palette.purpleText,
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
                          color: Palette.purpleText,
                          fontWeight: FontWeight.w600,
                          height: 1.5),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Palette.purpleText,
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
                color: Palette.purpleTextDark,
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
                    color: Palette.purpleText,
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
        for (final bank in CashInvestment._bankList) _bankBalance(bank)
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
                  color: Palette.purpleTextDark,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              bank.number,
              style: const TextStyle(
                  color: Palette.purpleText,
                  fontSize: 10,
                  fontWeight: FontWeight.w400),
            )
          ],
        ),
        const Spacer(),
        Text(
          _formatBalance(bank.balance),
          style: const TextStyle(
              color: Palette.purpleTextDark,
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
