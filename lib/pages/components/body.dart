import 'package:flutter/material.dart';
import 'package:web_artel/constant.dart';

class Body extends StatelessWidget{
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
       margin: const EdgeInsets.all(50),
       child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
          Stack(
            children: <Widget>[
              Text(
                "Augmented reality for art",
                style: TextStyle(
                  fontSize: 48,
                  fontFamily: 'Tenor Sans',
                  wordSpacing: 4.0,
                  letterSpacing: 4.0,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 1.0
                    ..color = Colors.white,
                ),
              ),
              // Solid text as fill.
              Text(
                "Augmented reality for art",
                style: TextStyle(
                  fontSize: 48,
                  wordSpacing: 4.0,
                  letterSpacing: 4.0,
                  fontFamily: 'Tenor Sans',
                  color: kTextcolor.withOpacity(0.7),
                ),
              ),
            ],
          ),
            const Text(
              "The best solution for artists.",
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
                backgroundColor: Colors.white.withOpacity(0),
                shape: RoundedRectangleBorder(side: const BorderSide(
                    color: Colors.blue,
                    width: 3,
                    style: BorderStyle.solid
                ), borderRadius: BorderRadius.circular(4)),
              ), onPressed: () {  },
              child: const Text(
                "Learn More",
                style: TextStyle(
                  color: kTextcolor,
                  fontSize: 20,
                  wordSpacing: 4.0,
                  letterSpacing: 4.0,
                  fontFamily: 'PT Sans',
                ),
              ),
            ),
          ),
         ],
        ),
      ),
    );
  }
}