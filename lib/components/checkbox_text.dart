import 'package:flutter/material.dart';
import 'package:web_artel/components/checkbox.dart';
import 'package:web_artel/wrapper/check_box_value.dart';

class CheckBoxText extends StatefulWidget {
  final String text;
  CheckBoxValue checkBoxValue;
  final Stream<bool> stream;

  CheckBoxText({Key? key, required this.text, required this.checkBoxValue, required this.stream}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CheckBoxText(checkBoxValue, text);

  bool getValue(){
    return checkBoxValue.isChecked;
  }

}

class _CheckBoxText extends State<CheckBoxText> {
  CheckBoxValue checkBoxValue;
  String text;

  bool checkError = false;

  _CheckBoxText(this.checkBoxValue, this.text);

  void _updateCheckBorder(bool check) {
    if (mounted) {
      setState(() {
        checkError = check;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    widget.stream.listen((event) {
      _updateCheckBorder(event);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Row(
        children: [
          CheckBoxArtel(checkBoxValue: checkBoxValue),
          Text(
            text,
            style: TextStyle(
              color: checkError ? Colors.red : Colors.black,
              fontSize: 18,
              fontFamily: 'Tenor Sans',
              wordSpacing: 4.0,
              letterSpacing: 4.0,
            ),
          ),
        ],
      ),
    );
  }

}