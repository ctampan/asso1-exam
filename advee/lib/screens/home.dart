import 'package:advee/sections/cash_investment.dart';
import 'package:advee/sections/investment_for_you.dart';
import 'package:advee/sections/invite_friends.dart';
import 'package:advee/sections/protection.dart';
import 'package:advee/sections/quotes.dart';
import 'package:advee/sections/recommendation.dart';
import 'package:advee/sections/simulate_investment.dart';
import 'package:advee/sections/topup_bills.dart';
import 'package:advee/sections/welcome.dart';
import 'package:flutter/material.dart';

import '../sections/learn_invest.dart';
import '../sections/recent_transaction.dart';
import '../widgets/app_bar.dart';
import '../widgets/bottom_navbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appBar(context),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              welcomeSection(context),
              recommendationSection(context),
              const SizedBox(
                height: 10,
              ),
              cashInvestmentSection(),
              simulateInvestmentSection(context),
              const SizedBox(
                height: 20,
              ),
              learnInvestSection(context),
              const SizedBox(
                height: 25,
              ),
              investmentForYouSection(context),
              const SizedBox(
                height: 15,
              ),
              protectionSection(context),
              const SizedBox(
                height: 15,
              ),
              topupBillsSection(context),
              const SizedBox(
                height: 15,
              ),
              recentTransactionSection(context),
              const SizedBox(
                height: 25,
              ),
              inviteFriendsSection(context),
              const SizedBox(
                height: 35,
              ),
              quotesSection(context),
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomNavigationBar(),
    );
  }
}
