import 'package:flutter/material.dart';

import '../../../../constant.dart';

class TitleBlock extends StatelessWidget{
  final double width;
  final double height;
  final bool isPopular;
  final String title;

  const TitleBlock({Key? key,
    required this.width,
    required this.height,
    required this.title,
    required this.isPopular}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: isPopular ? const Color.fromRGBO(45, 156, 219, 0.3) : null,
        ),
        child: Container(
          margin: const EdgeInsets.all(28.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: kTextcolor,
                  fontSize: 30,
                  letterSpacing: 4.0,
                  fontFamily: 'Tenor Sans',
                ),
              ),
            ]
          )
        ),
      )
    );
  }

}