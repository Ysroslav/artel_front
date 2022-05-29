import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';

class PriseText extends StatelessWidget{
  final Decimal prise;
  final bool isPopular;
  
  const PriseText({
    Key? key,
    required this.prise,
    required this.isPopular}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: <Widget>[
              Text(
                prise.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isPopular ? Colors.deepOrange : Colors.black,
                  fontSize: 32,
                  letterSpacing: 4.0,
                  fontFamily: 'PT Sans',
                ),
              ),
              Icon(Icons.euro,
                color: isPopular ? Colors.deepOrange : Colors.black,
                size: 32.0),
            ]
          )
        ],
      )
    );
  }
  
}