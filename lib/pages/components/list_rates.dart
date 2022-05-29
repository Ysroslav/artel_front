import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';

import 'rate/rate_block.dart';

class ListRates extends StatelessWidget{
  const ListRates({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Row (
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RateBlock(
            title: 'Amature',
            description: 'Lorem ipsum dolor sit amet, consectetur',
            prise: Decimal.parse('77777.77'),
            isPopular: false),
          RateBlock(
            title: 'Professional',
            description: 'Lorem ipsum dolor sit amet, consectetur',
            prise: Decimal.parse('77777'),
            isPopular: true),
          RateBlock(
            title: 'Genius',
            description: 'Lorem ipsum dolor sit amet, consectetur',
            prise: Decimal.parse('77777'),
            isPopular: false)
        ]
      )
    );
  }

}