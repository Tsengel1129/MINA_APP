// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return Category(
      id: json['id'] as String,
      icon: json['icon'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      priority: json['priority'] as String,
      color: json['color'] as String,
      budget: json['budget'] as String,
      usedBudget: json['usedBudget'] as String);
}

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'icon': instance.icon,
      'name': instance.name,
      'type': instance.type,
      'priority': instance.priority,
      'color': instance.color,
      'budget': instance.budget,
      'usedBudget': instance.usedBudget
    };
