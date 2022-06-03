import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'dto/rate.dart';

void navigate(String namePage, BuildContext context){
  Navigator.pushNamed(context, namePage);
}

Future<List<Rate>> fetchRates() async {
  final response = await http.get(Uri.parse('http://localhost:8086/rate/api/v1/rates'));
  if (response.statusCode == 200){
    return (json.decode(response.body) as List).map((data) => Rate.fromJson(data)).toList();
  } else {
    throw Exception('Failed');
  }
}