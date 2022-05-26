import 'package:flutter/material.dart';
import '../constant.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final Function press;
  const DefaultButton({
    required Key key,
    required this.text,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: TextButton(
        style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            minimumSize: const Size(50, 30),
            backgroundColor: kPrimaryColor,
        ),
        onPressed: () {  },
        child: Text(
          text.toUpperCase(),
        ),
      ),
    );
  }
}