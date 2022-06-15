import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web_artel/wrapper/input_text_error.dart';

class InputArtelText extends StatefulWidget {
  final String textPlaceholder;
  final String label;
  final TextEditingController _controller = TextEditingController();
  final Stream<InputBoxError> stream;
  final String textError;


  InputArtelText(
      {Key? key, required this.textPlaceholder, required this.label, required this.stream, required this.textError})
      : super(key: key);

  @override
  _InputArtelText createState() => _InputArtelText(textPlaceholder, label, _controller, textError);

  String getValue(){
    return _controller.text;
  }
}

class _InputArtelText extends State<InputArtelText> {
  final String textPlaceholder;
  final String label;
  final TextEditingController _controller;
  final String textError;
  final _focusNode = FocusNode();

  _InputArtelText(this.textPlaceholder, this.label, this._controller, this.textError);

  bool checkBorder = false;
  bool checkText = false;

  void _updateCheckBorder(InputBoxError checkError) {
      if (mounted) {
        setState(() {
        checkBorder = checkError.errorBorder;
        checkText = checkError.errorText;
      });
      }
  }


  @override
  void initState() {
    super.initState();
    widget.stream.listen((event) {
      _updateCheckBorder(event);
    });
    _controller.addListener(() {
      final String text = _controller.value.text;
      _controller.value = _controller.value.copyWith(
        text: text,
        composing: TextRange.empty,
      );
    });
    _focusNode.addListener(() {
      if(_focusNode.hasFocus) {
        _controller.selection = TextSelection(baseOffset: 0, extentOffset: _controller.text.length);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child:  Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.text,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter(
                  RegExp(r"[-@._0-9a-zA-Z ]"), allow: true),
            ],
            controller: _controller,
            focusNode: _focusNode,
            decoration: InputDecoration(
              errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Colors.red,
                      width: 3,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(5)
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: checkBorder ? Colors.red : const Color.fromRGBO(45, 156, 219, 0.5),
                      width: 3,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(5)
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: checkBorder ? Colors.red : const Color.fromRGBO(45, 156, 219, 0.5),
                      width: 3,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(5)
              ),
              hintText: textPlaceholder,
              errorText: checkText ? textError : null
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text(
                  label,
                  style: const TextStyle(
                    fontSize: 15,
                    fontFamily: 'Tenor Sans',
                    wordSpacing: 4.0,
                    letterSpacing: 4.0,
                  ),
                ),
              ),
              const Text(
                '*',
                style: TextStyle(color: Colors.red),
              ),
            ],
          )
        ]
      ),
    );
  }

}