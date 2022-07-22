import 'dart:async';

import 'package:flutter/material.dart';
import 'package:web_artel/components/checkbox_text.dart';
import 'package:web_artel/components/input_text.dart';
import 'package:web_artel/wrapper/input_text_error.dart';

import '../dto/rate.dart';
import '../functions.dart';
import '../wrapper/check_box_value.dart';
import 'button_ref.dart';

class PopupDialog extends StatefulWidget {
  final Rate rate;

  PopupDialog({Key? key, required this.rate}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PopupDialog(rate);

}

class _PopupDialog extends State<PopupDialog> {
  final Rate rate;
  _PopupDialog(this.rate);

  static StreamController<InputBoxError> checkErrorName = StreamController<InputBoxError>.broadcast();
  static StreamController<InputBoxError> checkErrorEmail = StreamController<InputBoxError>.broadcast();
  static StreamController<bool> checkErrorBox = StreamController<bool>.broadcast();


  final nameInput = InputArtelText(textPlaceholder:'John Smith', label: 'Name', stream: checkErrorName.stream, textError: '');
  final emailInput = InputArtelText(textPlaceholder:'johnsmith@gmail.com', label: 'Email', stream: checkErrorEmail.stream, textError: 'Email not content symbol @',);
  final checkBox = CheckBoxText(text: 'I am agree all rules', checkBoxValue: CheckBoxValue(false), stream: checkErrorBox.stream);

  late Color colorBorder;

  void callback(Color color){
    setState((){
      colorBorder = color;
    });
  }

  void createPaymentAndCheckData(){
    int check = 0;
    if (nameInput.getValue().isEmpty) {
      checkErrorName.add(InputBoxError(true, false));
    } else {
      checkErrorName.add(InputBoxError(false, false));
      check++;
    }
    if (emailInput.getValue().isEmpty) {
      checkErrorEmail.add(InputBoxError(true, false));
    } else if (!emailInput.getValue().contains('@')) {
      checkErrorEmail.add(InputBoxError(false, true));
    } else {
      checkErrorEmail.add(InputBoxError(false, false));
      check++;
    }
    if (!checkBox.getValue()) {
      checkErrorBox.add(true);
    } else {
      checkErrorBox.add(false);
      check++;
    }
    if (check == 3) {
      createPayment(rate, emailInput.getValue(), nameInput.getValue());
    }
  }

  @override
  Widget build(BuildContext context) {
    int check;
    return AlertDialog(
      content: SizedBox(
        width: 450,
        height: 560,
        child: Column(
          children: [
            Container(
              alignment: FractionalOffset.topRight,
              child: GestureDetector(child: const Icon(Icons.clear,color: Colors.grey,),
                onTap: (){
                  Navigator.pop(context);
                },),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/logos/registration.png",
                    height: 60,
                    alignment: Alignment.topCenter,
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: Column(
                      children: [
                        nameInput,
                        emailInput,
                      ],
                    ),
                  ),
                  checkBox,
                  ButtonRef(isPopular: true, title: 'Register & Pay',
                            onPressed: () => createPaymentAndCheckData()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: const Text(
                          '*',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                      const Text(
                        '- required fields',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Tenor Sans',
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        )
      )
    );
  }

}