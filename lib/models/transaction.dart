import 'package:expensemanager/config/config.dart';
import 'package:expensemanager/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Transaction {
  final String id;
  final Category category;
  final String description;
  final DateTime timestamp;
  final double amount;

  Transaction({
    this.id,
    this.category,
    this.description,
    this.timestamp,
    this.amount,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        id: json['id'] as String,
        category: Category.fromJson(json['category'] as Map<String, dynamic>),
        description: json['description'],
        timestamp: (json['timestamp'] as Timestamp).toDate(),
        amount: double.parse(json['amount']),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': this.id,
        'category': this.category.toJson(),
        'description': this.description,
        'timestamp': this.timestamp,
        'amount': this.amount.toString(),
      };
}
