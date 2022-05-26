import 'package:flutter/material.dart';
import '../../../constant.dart';

class MenuItem extends StatefulWidget {
  final String title;
  final Function press;

  const MenuItem({
    required Key key,
    required this.title,
    required this.press,
  }) : super(key: key);

  @override
  _MenuItem createState() => _MenuItem(title);
}

class _MenuItem extends State<MenuItem> {
  final String title;

  _MenuItem(this.title);
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {

  return InkWell(
    onTap: () => "",
    onHover: (hovering){
         setState(() => isHovering = hovering);
    },
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.ease,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
      color: isHovering ? Colors.indigoAccent : null,
      borderRadius: BorderRadius.circular(10),
    ),
          child: Text(
            title,
            style: TextStyle(
            color: isHovering ? Colors.white : kTextcolor.withOpacity(0.6),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
