import 'dart:core';
import 'package:decimal/decimal.dart';

class Rate {
  final String id;
  final String name;
  final String description;
  final Decimal prise;
  final int termRate;
  final bool isActive;
  final DateTime dateAdd;

  const Rate({
    required this.id,
    required this.name,
    required this.description,
    required this.prise,
    required this.termRate,
    required this.isActive,
    required this.dateAdd
});

   factory Rate.fromJson(Map<String, dynamic> json) {
     return Rate(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      prise: json['prise'],
      termRate: json['termRate'],
      isActive: json['isActive'],
      dateAdd: json['dateAdd']
    );
   }
}