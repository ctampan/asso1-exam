import 'dart:ui';

class Bank {
  const Bank(
      {required this.name,
      required this.number,
      required this.balance,
      required this.logoPath,
      required this.color});

  final String name;
  final String number;
  final int balance;
  final String logoPath;
  final Color color;
}