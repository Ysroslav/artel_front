import 'dart:core';

import 'package:flutter/material.dart';

class BodyBlock extends StatelessWidget{
  final double width;
  final double height;
  final bool isPopular;
  final bool isHovering;
  final Widget child;

  const BodyBlock({Key? key,
  required this.width,
  required this.height,
  required this.isPopular,
  required this.isHovering,
  required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      width: width,
      height: height,
      decoration: BoxDecoration(
        image: isPopular ? const DecorationImage(
        image: AssetImage(
          "logos/main_popular.png"
        ),
        fit: BoxFit.scaleDown,
        alignment: Alignment.topRight
        ) : null,
        color: Colors.white,
        border: Border.all(
          color: const Color.fromRGBO(45, 156, 219, 0.4),
          width: 7,
        ),
        borderRadius: BorderRadius.circular(9),
        boxShadow: [
        isHovering ?
          BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: const Offset(0, 3), // changes position of shadow
          ) : const BoxShadow(),
        ],
      ),
      child: child,
    );
  }

}