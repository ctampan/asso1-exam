import 'package:advee/theme/palette.dart';
import 'package:advee/widgets/cash_investment.dart';
import 'package:advee/widgets/investment_for_you.dart';
import 'package:advee/widgets/recommendation_widget.dart';
import 'package:advee/widgets/simulate_investment.dart';
import 'package:advee/widgets/welcome_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/app_bar.dart';
import '../widgets/learn_invest.dart';

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
              welcomeWidget(context),
              recommendationWidget(context),
              const SizedBox(
                height: 10,
              ),
              const CashInvestment(),
              simulateInvestment(context),
              const SizedBox(
                height: 20,
              ),
              learnInvest(context),
              const SizedBox(
                height: 20,
              ),
              investmentForYou(context),
            ],
          ),
        ),
      ),
    );
  }
}
