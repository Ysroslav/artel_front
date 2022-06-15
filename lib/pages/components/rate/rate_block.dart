import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:web_artel/components/button_ref.dart';
import 'package:web_artel/components/popup_dialog.dart';
import 'package:web_artel/pages/components/rate/components/body_block.dart';
import 'package:web_artel/pages/components/rate/components/prise_text.dart';

import '../../../functions.dart';
import 'components/list_description.dart';
import 'components/title_block.dart';

class RateBlock extends StatefulWidget{
  final String title;
  final String description;
  final Decimal prise;
  final bool isPopular;
  final double width;

  const RateBlock(
    {Key? key,
    required this.title,
    required this.description,
    required this.prise,
    required this.isPopular,
    required this.width}
  ) : super(key: key);

  @override
  _RateBlock createState() => _RateBlock(title, description, prise, isPopular, width);
}

class _RateBlock extends State<RateBlock>{
  final String title;
  final String description;
  final Decimal prise;
  final bool isPopular;
  final double width;


  _RateBlock(this.title, this.description, this.prise, this.isPopular, this.width);

  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    List<String> list = description.split('\n').map((str) => str.trim()).toList();
    return InkWell(
      onTap: () => "press()",
      onHover: (hovering){
        setState(() => {
          isHovering = hovering,
        });
      },
      hoverColor: Colors.white.withOpacity(0),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.ease,
        child: BodyBlock(
          width: width,
          height: 500,
          isPopular: isPopular,
          isHovering: isHovering,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TitleBlock(width: width, height: 100, isPopular: isPopular, title: title),
              ListDescription(height: 230.0, desc: list),
              PriseText(prise: prise, isPopular: isPopular),
              ButtonRef(isPopular: isPopular, title: 'Sign In',
                  onPressed: () => showDialogArtel(context, PopupDialog())
        )
            ]
          )
        )
      )
    );
  }
}