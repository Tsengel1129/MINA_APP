import 'package:cloud_firestore/cloud_firestore.dart';

class Wallet {
  final String id;
  final String name;
  final DateTime timestamp;
  final double amount;

  Wallet({
    this.id,
    this.name,
    this.timestamp,
    this.amount,
  });

  factory Wallet.fromJson(Map<String, dynamic> json) => Wallet(
        id: json['id'] as String,
        name: json['name'],
        timestamp: (json['timestamp'] as Timestamp).toDate(),
        amount: double.parse(json['amount']),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': this.id,
        'name': this.name,
        'timestamp': this.timestamp,
        'amount': this.amount.toString(),
      };
}
