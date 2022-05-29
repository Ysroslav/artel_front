import 'package:flutter/material.dart';
import 'package:web_artel/pages/components/list_rates.dart';

import 'components/app_bar.dart';

class Pricing extends StatelessWidget{
  const Pricing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
              const ListRates()
            ]
          )
        ),
      ),
    );
  }

}