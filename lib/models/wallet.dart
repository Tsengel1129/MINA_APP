import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expensemanager/models/models.dart';

class Wallet {
  final String id;
  final String name;
  final DateTime timestamp;
  final double amount;
  final double bankId;
  final String accountType;
  final String currency;

  Wallet(
      {this.id,
      this.name,
      this.timestamp,
      this.amount,
      this.bankId,
      this.accountType,
      this.currency});

  factory Wallet.fromJson(Map<String, dynamic> json) => Wallet(
      id: json['id'] as String,
      name: json['name'],
      timestamp: (json['timestamp'] as Timestamp).toDate(),
      amount: double.parse(json['amount']),
      bankId: double.parse(json['bankId']),
      accountType: json['accountType'],
      currency: json['currency']);

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': this.id,
        'name': this.name,
        'timestamp': this.timestamp,
        'amount': this.amount.toString(),
        'bankId': this.bankId.toString(),
        'accountType': this.accountType,
        'currency': this.currency
      };
}
