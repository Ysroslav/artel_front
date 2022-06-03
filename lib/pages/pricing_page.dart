import 'package:flutter/material.dart';
import 'package:web_artel/pages/components/list_rates.dart';

import '../dto/rate.dart';
import '../functions.dart';
import 'components/app_bar.dart';

class Pricing extends StatefulWidget {
  const Pricing({Key? key}) : super(key: key);

  @override
  _Pricing createState() => _Pricing();
}

class _Pricing extends State<Pricing> {
  late Future<List<Rate>> rates;

  @override
  void initState(){
    super.initState();
    rates = fetchRates();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "logos/main_pricing.png",
                  height: 40,
                  alignment: Alignment.topCenter,
                ),
              ]
            ),
            ListRates(rates: rates),
          ]
        )
      )
    );
  }

}