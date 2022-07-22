import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';
import '../../dto/rate.dart';
import 'rate/rate_block.dart';

class ListRates extends StatefulWidget {
  final Future<List<Rate>> rates;

  const ListRates({Key? key, required this.rates}) : super(key: key);

  @override
  _ListRates createState() => _ListRates(rates);
}

class _ListRates extends State<ListRates>{
  final Future<List<Rate>> rates;
  final double? size = 440;

  _ListRates(this.rates);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child : FutureBuilder<List<Rate>>(
            future: rates,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return  SizedBox(
                  width: size! * snapshot.data!.length,
                  height: 540.0,
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return RateBlock(
                        title: snapshot.data![index].name,
                        description: snapshot.data![index].description,
                        prise: snapshot.data![index].prise,
                        isPopular: snapshot.data![index].isPopular,
                        width: snapshot.data!.length > 3 ? sizeRateBlockMore : sizeRateBlockDefault,
                        rate: snapshot.data![index]
                      );
                    }
                  )
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            },
          )
        )
      ]
    );
  }

}