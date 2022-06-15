import 'package:flutter/material.dart';


class ButtonRef extends StatefulWidget {
  final String title;
  final bool isPopular;
  final VoidCallback onPressed;

  const ButtonRef({
    Key? key,
    required this.isPopular,
    required this.title,
    required this.onPressed}) : super(key: key);

  @override
  _ButtonRef createState() => _ButtonRef(this.title, this.isPopular, this.onPressed);

}

class _ButtonRef extends State<ButtonRef>{
  final String title;
  final bool isPopular;
  final VoidCallback onPressed;

  _ButtonRef(this.title, this.isPopular, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return  Container (
      margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 0),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          minimumSize: const Size(50, 30),
          backgroundColor: isPopular ?  const Color.fromRGBO(45, 156, 219, 1) : Colors.white,
          shape: RoundedRectangleBorder(side: const BorderSide(
              color: Color.fromRGBO(45, 156, 219, 0.5),
              width: 3,
              style: BorderStyle.solid
          ), borderRadius: BorderRadius.circular(4)),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
            color: isPopular ? Colors.white : Colors.black,
            fontSize: 20,
            wordSpacing: 4.0,
            letterSpacing: 4.0,
            fontFamily: 'PT Sans',
          ),
        ),
      ),
    );
  }
}