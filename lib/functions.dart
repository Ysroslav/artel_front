import 'dart:convert';
import 'dart:math';
import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:web_artel/components/popup_dialog.dart';
import 'package:web_artel/dto/payment.dart';

import 'dto/rate.dart';

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';

Random _rnd = Random();

void navigate(String namePage, BuildContext context){
  Navigator.pushNamed(context, namePage);
}

Future<List<Rate>> fetchRates() async {
  final response = await http.get(Uri.parse('http://localhost:8083/rate/api/v1/rates'));
  if (response.statusCode == 200){
    return (json.decode(response.body) as List).map((data) => Rate.fromJson(data)).toList();
  } else {
    throw Exception('Failed');
  }
}

Future<String?> showDialogArtel(BuildContext context,  PopupDialog dialogWidget){
  return showDialog(context: context, builder: (BuildContext context) => dialogWidget);
}

String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

Future<http.Response> createPayment(Rate rate, String email, String username) async {
  final idUser = base64.encode(utf8.encode(email));

  final payment = Payment(
      idDevice: getRandomString(20),
      keyIdempotent: getRandomString(20),
      nameUser: username,
      email: idUser,
      rateId: rate.id,
      amount: rate.prise.toString(),
      currency: 'EUR',  //TODO add currency in object
      description: rate.description,
      nameRate: rate.name);

  final response =  await http.post(
    Uri.parse('http://localhost:8001/api/v1/create'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(payment.toJson())
  );

  final url = response.body;
  html.window.location.assign(url);
  return response;
}

Future<http.Response> updatePayment(String paymentId) async {
  final response =  await http.put(
      Uri.parse('http://localhost:8001/api/v1/update/payment?key=$paymentId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
  );

  return response;
}

Future<bool> checkPayment(String email) async {
  await Future.delayed(const Duration(seconds: 1));
  final idUser = base64.encode(utf8.encode(email));
  final response =  await http.get(
    Uri.parse('http://localhost:8001/api/v1/check/payment?client_id=$idUser'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (response.statusCode == 200) {
    if (response.body.contains("SUCCEEDED")) {
      return true;
    }
    return false;
  }
  return false;
}


