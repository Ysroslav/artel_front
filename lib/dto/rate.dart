import 'dart:core';
import 'package:decimal/decimal.dart';

class Rate {
  final String id;
  final String name;
  final String description;
  final Decimal prise;
  final int termRate;
  final bool isActive;
  final bool isPopular;
  final DateTime dateAdd;

  const Rate({
    required this.id,
    required this.name,
    required this.description,
    required this.prise,
    required this.termRate,
    required this.isActive,
    required this.isPopular,
    required this.dateAdd
});

   factory Rate.fromJson(Map<String, dynamic> json) {
     return Rate(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      prise: Decimal.parse(json['prise'].toString()),
      termRate: json['termRate'],
      isActive: json['isActive'],
      isPopular: json['isPopular'],
      dateAdd: DateTime.parse(json['dateAdd'])
    );
   }
}