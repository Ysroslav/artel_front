import 'package:flutter/material.dart';

import '../../constant.dart';

class Footer extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Text(
            "Increase your sells",
            style: TextStyle(
              fontSize: 20,
              wordSpacing: 4.0,
              letterSpacing: 4.0,
              fontFamily: 'PT Sans',
              color: Colors.black,
            ),
          ),
          Container (
            margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 0),
            child: TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                minimumSize: const Size(50, 30),
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(side: const BorderSide(
                    color: Colors.blue,
                    width: 3,
                    style: BorderStyle.solid
                ), borderRadius: BorderRadius.circular(4)),
              ), onPressed: () {  },
              child: const Text(
                "Get started",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  wordSpacing: 4.0,
                  letterSpacing: 4.0,
                  fontFamily: 'PT Sans',
                ),
              ),
            ),
          ),
        ],
      )
    );
  }

}