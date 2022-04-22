import 'package:advee/theme/palette.dart';
import 'package:advee/widgets/my_investment_menu.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../types/Bank.dart';
import 'my_cash_menu.dart';

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
  double _extraHeight = 0;

  _handleChangeTab(String tabName) {
    setState(() {
      _activeTab = tabName;
      _extraHeight = tabName == 'My Investment' ? 70 : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 320 + _extraHeight,
        child: Stack(
          clipBehavior: Clip.hardEdge,
          children: [
            _menu(context: context, activeTab: _activeTab, extraHeight: _extraHeight),
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

Widget _menu({required BuildContext context, required String activeTab, required double extraHeight}) =>
    Positioned(
        top: 39,
        width: MediaQuery.of(context).size.width * 0.9,
        height: 251 + extraHeight,
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
          child: activeTab == "My Cash" ? myCashMenu(CashInvestment._bankList) : myInvestmentMenu(),
        ));

