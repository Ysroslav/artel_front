import 'package:flutter/material.dart';
import 'package:web_artel/wrapper/check_box_value.dart';

class CheckBoxArtel extends StatefulWidget {
  CheckBoxValue checkBoxValue;

  CheckBoxArtel({Key? key, required this.checkBoxValue}) : super(key: key);

  @override
  _CheckBoxArtel createState() => _CheckBoxArtel(checkBoxValue);

  bool getValue(){
    return checkBoxValue.isChecked;
  }

}

class _CheckBoxArtel extends State<CheckBoxArtel> {

  CheckBoxValue checkBoxValue;

  _CheckBoxArtel(this.checkBoxValue);


  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.red;
      }
      return Colors.blue;
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: checkBoxValue.isChecked,
      onChanged: (bool? value) {
        setState(() {
          checkBoxValue.isChecked = value!;
        });
      },
    );
  }

}