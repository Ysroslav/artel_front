import 'package:flutter/material.dart';

import '../../../../constant.dart';

class DescriptionRate extends StatelessWidget{
  final String description;
  const DescriptionRate(
      {Key? key,
      required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.all(20),
          child: const Icon(
            Icons.circle_outlined,
            size: 12.0)
        ),
        Flexible(
          child: Container(
            margin: const EdgeInsets.fromLTRB(0,20,0,0),
            child: Text(
              description,
              style: const TextStyle(
                color: kTextcolor,
                fontSize: 20,
                letterSpacing: 4.0,
                fontFamily: 'PT Sans',
              ),
            )
          )
        )
      ]
    );
  }

}