import 'dart:wasm';

import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
class Category {
  final String id;
  final String icon;
  final String name;
  final String type;
  final String priority;
  final String color;
  final String budget;
  final String usedBudget;

  Category(
      {this.id,
      this.icon,
      this.name,
      this.type,
      this.priority,
      this.color,
      this.budget,
      this.usedBudget});

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);

  toList() {}
}
