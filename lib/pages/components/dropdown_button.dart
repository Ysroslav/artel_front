import 'package:flutter/material.dart';
import 'package:web_artel/constant.dart';

class DropdownButtonWidget extends StatefulWidget {
  final String defaultValue;
  final List<String> items;

  const DropdownButtonWidget({
    Key? key,
    required this.defaultValue,
    required this.items
  }) : super(key : key);

  @override
  State<StatefulWidget> createState() => _DropdownButtonWidget(defaultValue, items);
}

class _DropdownButtonWidget extends State<DropdownButtonWidget> {
  String defaultValue;
  final List<String> items;

  _DropdownButtonWidget(this.defaultValue, this.items);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: defaultValue,
      icon: const Icon(Icons.arrow_drop_down_sharp),
      elevation: 16,
      style: TextStyle(
        color: kTextcolor.withOpacity(0.6),
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      underline: Container(
        height: 2,
        color: kTextcolor.withOpacity(0.6),
      ),
      onChanged: (String? newValue) {
        setState(() {
          defaultValue = newValue!;
        });
      },
      items: items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
            value: value,
            child: Text(value)
        );
      }).toList(),
    );
  }
}