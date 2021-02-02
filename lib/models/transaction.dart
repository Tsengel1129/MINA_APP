import 'package:expensemanager/config/config.dart';
import 'package:expensemanager/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Transaction {
  final String id;
  final String id2;

  final String walletId2;

  final Category category;
  final String description;
  final DateTime timestamp;
  final double amount;
  final double amount2;

  final String walletId;

  Transaction(
      {this.id,
      this.id2,
      this.walletId2,
      this.category,
      this.description,
      this.timestamp,
      this.amount,
      this.amount2,
      this.walletId});

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        id: json['id'] as String,
        id2: json['id2'] as String,
        walletId: json['walletId'] as String,
        walletId2: json['walletId'] as String,
        category: Category.fromJson(json['category'] as Map<String, dynamic>),
        description: json['description'],
        timestamp: (json['timestamp'] as Timestamp).toDate(),
        amount: double.parse(json['amount']),
        amount2: double.parse(json['amount2']),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': this.id,
        'id2': this.id2,
        'walletId': this.walletId,
        'walletId2': this.walletId2,
        'category': this.category.toJson(),
        'description': this.description,
        'timestamp': this.timestamp,
        'amount': this.amount.toString(),
        'amount2': this.amount2.toString(),
      };
}
